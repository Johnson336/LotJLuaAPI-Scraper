// index.js

const cheerio = require("cheerio")
const axios = require("axios")
const fs = require("fs")

const apiTarget = "https://lotj.github.io/lua-docs/"
const requestHeaders = {
  "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
};
const outputFolder = process.env.PWD + '/LotJLuaAPI/'

var class_headers = []

async function performScraping() {
  // downloading the target web page
  // by performing an HTTP GET require in Axios
  const axiosResponse = await axios.request({
    method: "GET",
    url: apiTarget,
    headers: requestHeaders,
  })

  // parsing the HTML source of the target web page with Cheerio
  const $ = cheerio.load(axiosResponse.data)

  // empty the class data structure
  // that will contain scraped class pages
  class_headers = []
  // scraping the class data section
  $("table").first()
  .find("tr")
  .each((index, element) => {
    // extracting data of interest
    const pageUrl = $(element).find("td").filter(".name").find("a").attr("href")
    const name = $(element).find("td").filter(".name").find("a").text().replace('_','').replace('core','LOTJ')
    const summary = $(element).find("td").filter(".summary").text()
    const line = {
      url: pageUrl,
      name: capitalize(name),
      summary: summary 
    }

    // adding scraped object to array
    class_headers.push(line)
  })
  //console.log(class_pages);

  writeHeaderFiles(class_headers)

  var class_functions = []
  // debug printout
  class_headers.forEach(function(element) {
    console.log(element.name+": '"+element.url+"' - "+element.summary);
    performScrapeHeaders(element)
  });
 //console.log(class_headers[0])
 //performScrapeHeaders(class_headers[0]);




}

function capitalize(word) {
return word.charAt(0).toUpperCase() + word.slice(1);
}



function addToArray(arr, item) {
  let found = false
  for (let i=0;i<arr.length;i++) {
    if (item.functionName in arr[i]) {
      found = true
      arr[i].concat(item)
    }
  }
  if (!found) {
    arr.push(item)
  }
}

async function performScrapeHeaders(page) {
  var class_functions = []
  const axiosResponse = await axios.request({
    method: "GET",
    url: apiTarget+page.url,
    headers: requestHeaders,
  })
  
  // parse the resulting html to scrape what we want
  const $ = cheerio.load(axiosResponse.data)
  
  $("table").filter(".function_list")
  .find("tr")
  .each((index, element) => {
    const functionName = $(element).find(".name").find("a").text().replace('_','')
    const functionDesc = $(element).find(".summary").text()

    const line = {
      functionName: capitalize(functionName),
      functionDesc: functionDesc
    }
    class_functions.push(line)
  })

  /*
  let nextLine = []
  let function_names = []
  $("dl").filter(".function")
  .find("dt")
  .each((index, element) => {
    const functionName = $(element).find("strong").text()
    function_names.push({
      functionName: capitalize(functionName)
    })
  })
  let function_builder = []
  $("dl").filter(".function")
  .find("dd")
  .each((index, element) => {
    const functionLongDesc = $(element).text() 
    function_builder.functionLongDesc = functionLongDesc;
    let parameters = []
    let returns = []
    $(element).find("li").each((i, e) => {
      const parameter_name = $(e).find(".parameter").text()
      const parameter_type = $(e).find(".type").text()
      const parameter_desc = $(e).text()
      const found_parameter = {
        para_name: parameter_name,
        para_type: parameter_type,
        para_desc: parameter_desc.slice(parameter_desc.search(parameter_type))
      }
      parameters.push(found_parameter);
    })
    function_builder.parameters = parameters;
    $(element).find("ol").each((i, e) => {
      const return_type = $(e).find(".types").find(".type").text()
      const return_desc = $(e).text()
      function_builder["return_type"] = return_type;
      function_builder["return_desc"] = return_desc.slice(return_desc.search(return_type))
    })
    function_builder["functionName"] = function_names[index];
    function_builder.forEach((e) => {
      console.log(e)
    })
    addToArray(class_functions, function_builder)
    function_builder = []
  })
  
*/

  class_functions.forEach(function(element) {
    let line = ""
    line += "---"+element.functionDesc+"\n"
    line += "---\n"
    /*
    line += "---"+element.functionLongDesc+"\n"
    line += "---\n"
    if ("parameters" in element) {
      element.parameters.forEach((el) =>  {
        line += "---@param "+el.para_name+" "+el.para_type+" "+el.para_desc+"\n"
      })
    }
    if ("return_type" in element) {
      line += "---@return "+element.return_type+" # "+element.return_desc+"\n---\n"
    }
    */
    line += "function "+element.functionName+" end\n\n"


    appendLineToFile(page.name, line);
  })
  console.log("Added "+class_functions.length+" functions to "+page.name+".lua")
}


function writeLineToFile(element, line) {
  let filename = outputFolder + element + ".lua"
  fs.writeFile(filename, line, err => {
    if (err) {
      console.error(err);
    } else {
    }
  });

}

function appendLineToFile(element, line) {
  let filename = outputFolder + element + ".lua"
  fs.appendFile(filename, line, err => {
    if (err) {
      console.error(err);
    } else {
    }
  });

}

function writeHeaderFiles(classes) {
  try {
    if (!fs.existsSync(outputFolder)) {
      fs.mkdirSync(outputFolder);
    }
  } catch (err) {
    console.error(err);
  }


  classes.forEach(function(element) {
    let line = "---@meta "+element.name+"\r\n"
    console.log("writing header to file '"+element.name+".lua'")
    line += "---\r\n"
    line += "---"+element.summary+"\r\n"
    line += "---@class "+element.name+"\r\n"
    line += element.name+" = {}\r\n"
    line += "\r\n"
    writeLineToFile(element.name, line)
  });

}


performScraping()

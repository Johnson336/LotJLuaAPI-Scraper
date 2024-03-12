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
    const name = $(element).find("td").filter(".name").find("a").text().replace('_','')
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
  if (word.slice(0, 4).toLowerCase() == 'lotj' || word.toLowerCase() == 'core') {
    // special case handling for LOTJ Class
    return 'LOTJ'+ word.slice(4)
  } else {
    return word.charAt(0).toUpperCase() + word.slice(1);
  }
}

function cap_first(word) {
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
    const functionDesc = $(element).find(".summary").text().replace('\n', '\n---')

    const line = {
      functionName: capitalize(functionName),
      functionDesc: functionDesc
    }
    class_functions.push(line)
  })

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
  /*
  */
     

  var outerIndex = -1

  let function_builder = []
  $("dl").filter(".function")
  .find("dd")
  .each((index, element) => {
    outerIndex += 1
    const functionAllText = $(element).text() 
    // work backwards to strip out one section at a time
    let returnText = "";
    let parameterText = "";
    var usage = [];
    var returns = [];
    var parameters = [];
    let descEndIndex = 0;
    let usageIndex = functionAllText.search(/(Usage:)/);
    let returnsIndex = functionAllText.search(/(Returns:)/);
    let parametersIndex = functionAllText.search(/(Parameters:)/);
    if (usageIndex > 0) { // we found a usage section
      usage = functionAllText.slice(usageIndex+7).split('\n');
      descEndIndex = usageIndex;
    }
    if (returnsIndex > 0) { // found a returns section
      // check for end point
      let endPoint = functionAllText.length
      descEndIndex = returnsIndex;
      if (usageIndex > 0) {
        endPoint = usageIndex;
      }
      returnText = functionAllText.slice(returnsIndex+9, endPoint).split('\n');
      /*
      if (class_functions[outerIndex].functionName.search(/(getInstalledCyber)/) > -1) {
        console.log('start: %d end: %d', returnsIndex+9, endPoint)
        console.log(returnText);
      }
      */
      let index = 0;
      var returnVal = [];
      for (let i=0;i<returnText.length;i++) {
        if (returnText[i].trim() != "") {
          //console.log(returnText[i].trim());
          index += 1;
          switch (index) {
            case 1:
              let returnSplit = returnText[i].trim().split(' ')
              if (returnSplit.length > 1) {
                if (returnText[i].trim().search(/(iterator)/) > -1) {
                  returnVal.type = returnText[i].trim().slice(returnText[i].trim().search(/(iterator)/)+12);
                } else {
                  returnVal.type = "";
                }
                returnVal.desc = returnText[i].trim();
                index = 0
                returns.push(returnVal);
                returnVal = [];
              } else {
                returnVal.type = returnText[i].trim();
                // fix errant 'the' datatypes on various functions
                if (returnVal.type === "the") {
                  returnVal.type = "string";
                } else if (returnVal.type === "bool") {
                  returnVal.type = "boolean";
                } else if (returnVal.type === "int") {
                  returnVal.type = "integer";
                }
              }
              break;
            case 2:
              returnVal.desc = returnText[i].trim();
              index = 0;
              returns.push(returnVal);
              returnVal = [];
              break;
            default:
              index = 0;
            break;
          }
        }
      }
      // add this returnval into the list of returns for this function
      //returns.push(returnVal);
      //returnVal = [];
    }
    if (parametersIndex > 0) { // found parameters section
      // check for end point
      let endPoint = functionAllText.length
      descEndIndex = parametersIndex;
      if (returnsIndex > 0) {
        endPoint = returnsIndex;
      } else if (usageIndex > 0) {
        endPoint = usageIndex;
      }
      parameterText = functionAllText.slice(parametersIndex+12, endPoint).split('\n');
      let index = 0
      var parameter = [];
      for (let a=0;a<parameterText.length;a++) {
        if (parameterText[a].trim() != "") {
          index += 1
          switch (index) {
            case 1:
              parameter.name = parameterText[a].trim();
            break;
            case 2:
              let splitParameter = parameterText[a].trim().split(' ')
              if (splitParameter.length > 1) {
                // second parameter with multiple words means we got a description instead
                // of a data type, that most likely means datatype is variable
                parameter.type = 'any';
                parameter.desc = parameterText[a].trim()
                index = 0;
                parameters.push(parameter);
                parameter = []
              } else {
                parameter.type = parameterText[a].trim()
                // fix incorrect abbreviations
                if (parameter.type === "func") {
                  parameter.type = "function";
                } else if (parameter.type === "int") {
                  parameter.type = "integer";
                } else if (parameter.type === "bool") {
                  parameter.type = "boolean";
                }
                // special case for callback functions
                if (parameter.type === "function") {
                  // everything after this is part of the description
                  parameter.desc = "";
                  for (let i=a+1;i < parameterText.length;i++) {
                    parameter.desc += ' '+parameterText[i].trim()
                  }
                  parameters.push(parameter);
                  parameter = []
                  index = parameterText.length // move index to end of list
                }

              }
            break;
            case 3:
              parameter.desc = parameterText[a].trim()
              index = 0;
              parameters.push(parameter);
              parameter = []
            default:
              // should never get here, reset index to 0 if we do
            break;
          }
        }
      }
      // add this parameter into the list of parameters for this function
      //parameters.push(parameter);
      //parameter = [];
    }
    // assign remaining functionAllText as long description
    var longDesc = functionAllText.slice(0, descEndIndex).split('\n');
    /*
    parameters.forEach((element) => {
      console.log(element);
    });
    */
    function_builder.push({
      //functionAllText: functionAllText,
      longDesc: longDesc,
      parameters: parameters,
      returns: returns,
      usage: usage,
    });

  });

  for (let i=0;i<function_names.length;i++) {
    let line = ""
    // function description
    // multi-line long description
    if (function_builder[i].longDesc.length > 0) {
      let addedLines = 0
      for (let j=0;j<function_builder[i].longDesc.length;j++) {
        if (function_builder[i].longDesc[j].trim() != "") {
          addedLines += 1
          line += "---"+function_builder[i].longDesc[j].trim()+'\n';
        }
      }
      if (addedLines == 0) {
        // if all of our multiline desc was blank, revert to short desc
        line += "---"+class_functions[i].functionDesc+'\n---\n';        
      }
    } else {
      // revert to the short description
        line += "---"+class_functions[i].functionDesc+'\n---\n';        
    }

    // function usage
    if (function_builder[i].usage.length > 0) {
      line += "---\n---Usage:\n---```\n";
      for (let j=0;j<function_builder[i].usage.length;j++) {
        if (function_builder[i].usage[j].trim() != "") {
          line += "---    "+function_builder[i].usage[j].trim()+'\n';
        }
      }
      line += "---```\n";
    }
    // function parameters
    for (let j=0;j<function_builder[i].parameters.length;j++) {
      let param = function_builder[i].parameters[j];
      line += "---@param "+param.name+" "
      if (param.type != "") {
        line += param.type+" ";
      }
      line += param.desc + '\n';
      //console.log(function_builder[i].parameters[j]);
    }
    // function returns
    for (let j=0;j<function_builder[i].returns.length;j++) {
      let returnVal = function_builder[i].returns[j];
      line += "---@return "
      if (returnVal.type != "") {
        line += returnVal.type+" "
      }
      line += "# "+returnVal.desc+"\n"
    }
    // function prototype definition 
    line += "function "+class_functions[i].functionName+" end\n\n"
    // append full function output to header file
    appendLineToFile(page.name, line);
  }
  
  console.log("Added "+class_functions.length+" functions to "+page.name+".lua")

   /* 
    console.log('function name: %s', function_names[i].functionName);
    console.log('class_function.desc: %s', class_functions[i].functionDesc);
    console.log('class_function.name: %s', class_functions[i].functionName);
    console.log('function_builder.parameters: ');
    if (function_builder[i].usage != "") {
      console.log('  usage: %s', function_builder[i].usage);
    }
  }
  console.log('total function_names: %d\ntotal class_functions: %d', function_names.length, class_functions.length);
  */
  /*
  function_names.forEach((element) => {
    console.log('element: %s', element)
  });
  */
  /*
  class_functions.forEach(function(element) {
    let line = ""
    line += "---"+element.functionDesc+"\n"
    line += "---\n"
    */
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
   /*
    line += "function "+element.functionName+" end\n\n"


    appendLineToFile(page.name, line);
  })
  */
}

function strip_white_space(input) {
  let out = input.replace(/(\r)/gm, "")
  return out;
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
  // this section creates outputFolder if it doesn't exist
  try {
    if (!fs.existsSync(outputFolder)) {
      fs.mkdirSync(outputFolder);
    }
  } catch (err) {
    console.error(err);
  }

  // this section deletes all files inside outputFolder
  fs.readdirSync(outputFolder).forEach(f => fs.rmSync(`${outputFolder}/${f}`));


  // this section creates all new class header files
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

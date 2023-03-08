// validate codeVars
console.log("Start codeVars test...");
if (codeVars["sup"] != "Hello!") {
  throw "codeVars is wrong! maybe a bad reference???"
}
console.log("codeVars test successful!");

// get pages
console.log("Start pages() test...");
let myPages = await pages();
if (myPages.length != 1) {
  throw "Should be only one page here!"
}
console.log("pages() test successful!");

// test create a new page
console.log("Start newPage() test...");
let myNewPage = await newPage();
await myNewPage.goto("https://fetchtest.datahen.com/cookie");
let content = await myNewPage.content();
if (!content.match(/This\s+should\s+set\s+the\s+cookie/)) {
  throw "Cookie page failed to load"
}
myPages = await pages();
if (myPages.length != 2) {
  throw "Should be two page here!"
}
content += codeVars["sup"];
console.log("newPage() test successful!");

// test new page by the target website
console.log("Start new page from website test...");
await page.evaluate(() => {
  let element = document.createElement("div");
  element.innerHTML = "<a id='myLink' href='https://fetchtest.datahen.com/echo/ip' target='_blank'>Click me!</a>";
  document.getElementsByTagName("body")[0].append(element);
  document.getElementById('myLink').click();
});
await sleep(3000); // wait a bit for the new page to be created
myPages = await pages();
if (myPages.length != 3) {
  throw "Should be 3 page here!"
}
let targetPage = myPages[2];
if (targetPage.url() != 'https://fetchtest.datahen.com/echo/ip') {
  throw "Wrong page!"
}
await configPage(targetPage);
let myIP = await targetPage.content();
content += " This is my IP " + myIP;
console.log("New page from website test successful!");

// add data into the monitored page
console.log("Start write content test...");
content += '<div>ALL TESTS WERE SUCCESSFUL!</div>'
await page.evaluate((data) => {
  let element = document.createElement("div");
  element.innerHTML = data;
  document.getElementsByTagName("body")[0].append(element);
}, content);
console.log("Write content test successful!");
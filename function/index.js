exports.handler = async function(event, context) {
  console.log("ENVIRONMENT VARIABLES\n" + JSON.stringify(process.env, null, 2))
  console.log("EVENT\n" + JSON.stringify(event, null, 2))
  console.log("CONTEXT\n"+JSON.stringify(context));
  const response = {
    statusCode: 200,
    body: `test-lambda-function v5: ${JSON.stringify(event)}`,
  }
  
  return response;
}

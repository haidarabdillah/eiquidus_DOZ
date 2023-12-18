const { exec } = require('child_process');
let isCheckerTime = true;

setInterval(async () => {
  if (isCheckerTime) {
    isCheckerTime = false;
    console.log('=========start worker job============');
    const currentTime = new Date();
    console.log(`Current Date and Time: ${currentTime.toLocaleString()}`);
    const command1 = `npm run sync-blocks`;
    const command2 = `npm run sync-peers`;
    const command3 = `npm run check-blocks`;
    await exec(command1, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.error(`Error: ${stderr}`);
        return;
      }
      console.log(`Sync output: ${stdout}`);
    });
    await exec(command2, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.error(`Error: ${stderr}`);
        return;
      }
      console.log(`Sync output: ${stdout}`);
    });
    await exec(command3, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.error(`Error: ${stderr}`);
        return;
      }
      console.log(`Sync output: ${stdout}`);
    });
    isCheckerTime = true;
    console.log('=========ended worker job============');
  }
}, 18000);

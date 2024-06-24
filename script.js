const extractData = (text) => {
  // Split the text by line breaks, removing leading/trailing whitespace
  const lines = text.trim().split('\n').map(line => line.trim());

  // Initialize the dictionary
  const data = {};

  for (const line of lines) {
    // Check for lines containing course ID and course name
    if (line.startsWith('-')) {
      const parts = line.split('-').map(part => part.trim());
      if (parts.length >= 3) {
        data['mmh'] = parts[1];
        data['mon-hoc'] = parts[2];
      }
    }

    // Check for lines starting with "Giảng viên:"
    if (line.toLowerCase().startsWith('giảng viên:')) {
      const parts = line.split(':').map(part => part.trim());
      data['giang-vien'] = parts[1] || '';
    }
  }
  return data;
};


// Actual usage with DOM elements
const clearfixElements = document.querySelectorAll('.clearfix');
result = []
for (const element of clearfixElements) {
    const value = element.textContent.trim(); // Get text content and trim whitespaces
    const link = element.querySelector('a') ? element.querySelector('a').href : ''; // Get the href of the link if it exists
    console.log("Link access: ", link)
    data = extractData(value);
    data['url'] = link;
    result.push(data);
    console.log("info = [ \"" + data["mon-hoc"] + "\", " + data["giang-vien"] + "\", \"" + data["mmh"] + "\"]") 
}
result.map( (res) => {
    console.log("Link access: " , res['url'])
    const info = [
    `"${res["mon-hoc"]}"`,
    `"${res["giang-vien"]}"`,
    `"${res["mmh"]}"`,
    ];
    
    console.log(`
    info = [ "${res["mon-hoc"]}", "${res["giang-vien"]}",  "${res["mmh"]}"];
    info_default = ["Y", "2", "2023 - 2024"];
    all_info = info.concat(info_default);
    const textAreas = document.querySelectorAll('.input-ykien');
    textAreas.forEach(function (text, i) {
        console.log('%d: %s', i, text.value += all_info[i]);
    });
    const labels = document.querySelectorAll('label.mt-radio.disabled');

    for (const label of labels) {
      // Check if the label actually contains the radio button
      const radio = label.querySelector('input[type="radio"]');
      if (radio) {
        radio.click();
      } else {
        console.warn("Label element might not contain a radio button:", label);
      }
    } 
    const submitButton = document.querySelector('input[type="submit"].btn_submit_boxes[value="Gửi"]#btnGui[name="btnGui"]');

    if (submitButton) {
      submitButton.click();
      console.log("Submit button clicked successfully!");
    } else {
      console.warn("Submit button not found.");
    }
        `)
}
)
-------------
info = ["Nội khoa 1", "Lê Thị Kim Nhung", "012207829803"]
info_default = ["Y", "2", "2023 - 2024"]
all_info = info.concat(info_default)
const textAreas = document.querySelectorAll('.input-ykien');
textAreas.forEach(function (text, i) {
    console.log('%d: %s', i, text.value += all_info[i]);
});
const labels = document.querySelectorAll('label.mt-radio.disabled');

for (const label of labels) {
  // Check if the label actually contains the radio button
  const radio = label.querySelector('input[type="radio"]');
  if (radio) {
    radio.click();
  } else {
    console.warn("Label element might not contain a radio button:", label);
  }
}

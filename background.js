chrome.app.runtime.onLaunched.addListener(function() {
  chrome.app.window.create('index.html', {
    innerBounds: {
      maxWidth: 500,
      maxHeight: 500,
      minWidth: 200,
      minHeight: 200,
    }, state: "normal"
  });
});

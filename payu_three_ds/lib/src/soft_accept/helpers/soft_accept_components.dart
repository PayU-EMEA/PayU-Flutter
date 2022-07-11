class SoftAcceptComponents {
  String iframe(String redirectUri) {
    return '''
            <div class='modal'>
             <div class='modal-content'>
              <iframe sandbox='allow-forms allow-scripts allow-same-origin' src='$redirectUri'> 
              </iframe>
             </div>
            </div>
            ''';
  }

  String javascript(String origin, String channelName) {
    return '''
            javascript: (
              function () {
                window.addEventListener('message', handleMessage, false);
                function handleMessage(msg) {
                  if (msg.origin === '$origin') {
                    var result = { data: msg.data };
                    $channelName.postMessage(JSON.stringify(result));
                  }
                }
              }
            )();
            ''';
  }
}

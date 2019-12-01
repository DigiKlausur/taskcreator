$(document).ready(function() {

      

      $(".codemirror-markdown").map(function() {

        var md = marked(this.innerHTML);
        $(md).appendTo($(this).parent());
        this.hidden = true;
      });

      $(".codemirror-code").map(function() {
        CodeMirror.fromTextArea(this, {
          lineNumbers: true,
          readOnly: true,
          viewportMargin: Infinity,
          mode: 'python'
        });
      });

      $(".codemirror-comment").map(function() {
        CodeMirror.fromTextArea(this, {
          lineNumbers: false,
          readOnly: false,
          viewportMargin: Infinity,
          mode: 'markdown'
        });
      });

      $(".codemirror-output").map(function() {
        CodeMirror.fromTextArea(this, {
          readOnly: true,
          viewportMargin: Infinity,
          mode: "text"
        });
      });

    });
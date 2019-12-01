<!doctype html>
<head>
  <title>HBRS Grader</title>
    <script type="text/javascript" src="/static/components/codemirror/lib/codemirror.js"></script>
    <script src="/static/components/codemirror/mode/python/python.js"></script>
    <script src="/static/components/codemirror/mode/javascript/javascript.js"></script>
    <link rel="stylesheet" href="/static/components/codemirror/lib/codemirror.css">

</head>

<body>
  <h1>{{ title }}</h1>
  <div id="CellArea">
    <div id="answer">
        <textarea id="answer_cell">{{ answer }}</textarea>
        <textarea id="comment">Your comment here</textarea>
        <script>
          var answer_editor = CodeMirror.fromTextArea(answer_cell, {
            readOnly: true,
            lineNumbers: true,
            mode: 'python'
          });
          var comment_editor = CodeMirror.fromTextArea(comment, {
            mode: 'text'            
          });
        </script>
    </div>
  </div>
</body>
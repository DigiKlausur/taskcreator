<!doctype html>
<head>
  <title>HBRS Grader</title>
    <script type="text/javascript" src="/static/components/codemirror/lib/codemirror.js"></script>
    <script src="/static/componentes/codemirror/mode/python/python.js"></script>
    <link rel="stylesheet" href="/static/componentes/codemirror/lib/codemirror.css">

</head>

<body>
  <h1>{{ title }}</h1>
  <div id="CellArea">
    <textarea id="cell0">{{ answer }}</textarea>
    <script>
        var editor = CodeMirror.fromTextArea(cell0, {

        });
    </script>
  </div>
</body>
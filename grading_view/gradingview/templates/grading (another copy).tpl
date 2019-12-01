<!doctype html>
<head>
  <script type="text/javascript" src="/static/components/codemirror/lib/codemirror.js"></script>
  <script type="text/javascript" src="/static/components/codemirror/mode/python/python.js"></script>
  <script type="text/javascript" src="/static/components/codemirror/mode/markdown/markdown.js"></script>
  <script type="text/javascript" src="/static/components/marked/lib/marked.js"></script>
  <script type="text/javascript" src="/static/components/jquery/jquery.min.js"></script>
  <link rel="stylesheet" href="/static/components/codemirror/lib/codemirror.css">
  <style type="text/css">
    .cell {
      border: 1px solid #009ee0;
      background-color: #009ee0;
      width: 70%;
      margin-left: auto;
      margin-right: auto;
      margin-top: 3em;
    }

    .cell_output {
      background-color: white;
      margin: 0.3em;      
    }

    .cell_source {
      margin: 0.3em;
    }

    .CodeMirror {
      height: auto;
      text-align: left;
    }

    #solution {
      background-color: green;
      margin-top: 0.3em;
    }

    .solution_header {
      margin-left: 0.3em;
    }
  </style>
  <script type="text/javascript">
    $(document).ready(function() {

      $(".codemirror-markdown").map(function() {

        var md = marked(this.innerHTML);
        console.log($(md));
        console.log(this);
        console.log($(this));
        $(md).appendTo($(this).parent());
        this.hidden = true;
        //var div = $(document.createElement('div').html(md));
        //this.parentElement.append($('<div>').html(marked(this.innerHTML)).text());
        //console.log(marked(this.innerHTML));
        

      });

      $(".codemirror-textarea").map(function() {
        var mode = "markdown";
        if (this.id === 'code') {
          mode = "python";
        }
        CodeMirror.fromTextArea(this, {
          lineNumbers: true,
          readOnly: true,
          viewportMargin: Infinity,
          mode: mode
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

  </script>


  <title>HBRS Grader</title>
</head>

<body>
  <h1>{{ title }}</h1>
  {% for cell in nb.cells %}
  <div class='cell'>
    {% if 'nbgrader' in cell.metadata and cell.metadata.nbgrader.solution %}
    <div class='solution_header'>
        <span>Student solution</span>
        <span>Worth {{ cell.metadata.nbgrader.points }} points</span>      
    </div>
    {% endif %}
    <div class="source">
      {% if cell.cell_type == 'markdown' %}
      <textarea class="codemirror-markdown">{{ cell.source }}</textarea>
      {% else %}
      <textarea class="codemirror-textarea">{{ cell.source }}</textarea>
      {% endif %}
    </div>

  </div>
  
  {% endfor %}

</body>
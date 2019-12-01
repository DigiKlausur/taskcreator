<!doctype html>
<head>
  
  <script type="text/javascript" src="/static/components/codemirror/lib/codemirror.js"></script>
  <script type="text/javascript" src="/static/components/codemirror/mode/python/python.js"></script>
  <script type="text/javascript" src="/static/components/codemirror/mode/markdown/markdown.js"></script>

  <script type="text/javascript" src="/static/components/marked/lib/marked.js"></script>
  <script type="text/javascript" src="/static/components/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-AMS_HTML"></script>
  <link rel="stylesheet" href="/static/components/codemirror/lib/codemirror.css">
  <link type='text/css' rel='stylesheet' href='/static/css/style.css'/>
  <script src="/static/js/script.js"></script>


<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
            inlineMath: [ ['$','$'], ["\(","\)"] ],
            displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
            processEscapes: true,
            processEnvironments: true
        },
        // Center justify equations in code and markdown cells. Elsewhere
        // we use CSS to left justify single line equations in code cells.
        displayAlign: 'center',
        "HTML-CSS": {
            styles: {'.MathJax_Display': {"margin": 0}},
            linebreaks: { automatic: true }
        }
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
      <span id='solution_label'>Student solution</span>
      <div class='points'>
      <input class='point_input' type='number' value='0' min='0', max='{{ cell.metadata.nbgrader.points }}'></input>
      <span>/ {{ cell.metadata.nbgrader.points }}</span>      
      </div>
    </div>
    {% endif %}
    <div class="source">
      {% if cell.cell_type == 'markdown' %}
      <textarea class="codemirror-markdown">{{ cell.source }}</textarea>
      {% else %}
      <textarea class="codemirror-code">{{ cell.source }}</textarea>
      {% endif %}
    </div>
    {% if cell.cell_type == 'code' %}
    <div class='output'>
      {% for output in cell.outputs %}
              {% for key,value in output.items() %}
                {% if key == 'data' %}
                  {% for k,v in value.items() %}
                    {% if k == 'text/plain' %}
                      <textarea class='codemirror-output'>{{ v }}</textarea>
                    {% elif k == 'image/png' %}
                      <img src='data:{{ k }};base64,{{ v }}'/><br>
                    {% endif %}
                  {% endfor %}
                {% endif %}
              {% endfor %}
            {% endfor %}   
      
    </div>
    {% endif %}

    {% if 'nbgrader' in cell.metadata and cell.metadata.nbgrader.solution %}
    <div class="comment">
      <textarea class="codemirror-comment">Your comment here</textarea>
    </div>
    {% endif %}

  </div>
  
  {% endfor %}

</body>
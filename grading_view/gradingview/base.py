from notebook.base.handlers import IPythonHandler


class BaseHandler(IPythonHandler):

    def render(self, name, **ns):
        template = self.settings['hbrs_jinja2_env'].get_template(name)
        return template.render(**ns)
from .base import BaseHandler
import os
import json
import nbformat

class HbrsGraderBaseHandler(BaseHandler):

    def get(self):
        html = self.render('base.tpl', title='Wooohooo!')
        self.write(html)

class GraderViewBaseHandler(BaseHandler):

    def get(self, assignment):
        nb = nbformat.read(assignment, as_version=4)
        html = self.render('grading.tpl', nb=nb, title=assignment)
        self.write(html)

class CellHandler(BaseHandler):

    def get(self):
        html = self.render('cell.tpl', title='Cells', answer='This is my cool answer.')
        self.write(html)

class DebugHandler(BaseHandler):

    def get(self):
        text = ''
        for key in self.settings:
            text += '{}: {}<br>'.format(key, self.settings[key])
        self.write(os.getcwd())


root_path = os.path.dirname(__file__)
template_path = os.path.join(root_path, 'templates')

default_handlers = [
    (r"/grader/view/base", HbrsGraderBaseHandler),
    (r"/grader/view/grading/([^/]+)/?", GraderViewBaseHandler),
    (r"/debug", DebugHandler),
    (r"/cells", CellHandler),
]
#!/usr/bin/env python

from notebook.base.handlers import IPythonHandler
#from .spellchecker import SpellChecker
#import pkg_resources

'''
class SpellerWordHandler(IPythonHandler):

	def initialize(self, wordlist):
		self.speller = SpellChecker.fromfilename(wordlist)

	def get(self, word):
		self.finish(self.speller.correct(word))
'''

default_handlers = [
    #(r"/speller/api/correct/([^/]+)", SpellerWordHandler, dict(wordlist=pkg_resources.resource_filename('speller', 'wordlist.txt'))),
]
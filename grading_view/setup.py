# -*- coding: utf-8 -*-


from setuptools import setup, find_packages


with open('README.rst') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='gradingview',
    version='0.1.0',
    description='HBRS Grading View',
    long_description=readme,
    author='Tim Metzler',
    author_email='tim.metzler@h-brs.de',
    license=license,
    packages=find_packages(exclude=('tests', 'docs')),
    package_data={
        # Include any *.tpl files found in the 'hbrs_grader' package
        'grader': ['*.tpl'],
    },
    include_package_data = True,
    data_files = [
        ("etc/jupyter/jupyter_notebook_config.d", [
            "jupyter-config/jupyter_notebook_config.d/gradingview.json"
        ])
    ],
    zip_safe=False
)


# A presentation of the Powers Of_ten_ for PyData Triangle

November 1, 2017

The Nick and Tony Show


```python
    from IPython.display import *
    from pydata.style import *
    %load_ext literacy.template
    from nbformat.v4 import *; from pathlib import Path; from nbformat import *
```


<style>
    iframe {
        width: 100%;
        min-height: 80vh;
        max-height: 1000px;
    }
</style>



<style>
body.rise-hack-active div.reveal .code_cell .input,
body.rise-hack-active div.reveal .output_stderr {
    display: none;
}
button.rise-hack:hover {
    opacity: 0.7;
}
button.rise-hack {
    font-weight: bold;
}
body.rise-hack-active button.rise-hack {
    text-decoration: line-through;
}
body.rise-hack-active .reveal .rendered_html table {
    font-size: 16px;
}
body.rise-hack-active .reveal .prompt {
    display: none;
}
</style>



    <IPython.core.display.Javascript object>



```python
## RIPx Media

## Remote

* [Github](https://github.com/tonyfast/powersoften) useful static interative versions of notebooks
* [Nbviewer](http://nbviewer.jupyter.org/format/slides/github/tonyfast/powersoften/blob/gh-pages/pydata/index.ipynb#/) provides interative versions of static notebooks.  `assert \`ing `Javascript and IFrame`s still work 
* [Travis](https://travis-ci.org/tonyfast/powersoften) builds our docs ...
* ... on [Github Pages](https://tonyfast.github.io/powersoften/#/)
* [Binder](#)
* [Raw Git](https://cdn.rawgit.com/tonyfast/powersoften/gh-pages/pydata/index.html)

## Local

* [localhost](localhost:{{8888}}/files/powersoften/pydata/index.html)
* [file system](localhost:{{8888}}/files/powersoften/pydata/index.html)
```


## RIPx Media

## Remote

* [Github](https://github.com/tonyfast/powersoften) useful static interative versions of notebooks
* [Nbviewer](http://nbviewer.jupyter.org/format/slides/github/tonyfast/powersoften/blob/gh-pages/pydata/index.ipynb#/) provides interative versions of static notebooks.  `assert \`ing `Javascript and IFrame`s still work 
* [Travis](https://travis-ci.org/tonyfast/powersoften) builds our docs ...
* ... on [Github Pages](https://tonyfast.github.io/powersoften/#/)
* [Binder](#)
* [Raw Git](https://cdn.rawgit.com/tonyfast/powersoften/gh-pages/pydata/index.html)

## Local

* [localhost](localhost:8888/files/powersoften/pydata/index.html)
* [file system](localhost:8888/files/powersoften/pydata/index.html)



```python
# Topics

The major `topics = 'intro, design, systems, materials, community, media, culture'.\`  

        
        replace(' ','').split(',')
```


# Topics

The major `topics = 'intro, design, systems, materials, community, media, culture'.\`  

        
        replace(' ','').split(',')



```python
## Notebooks

{% for topic in topics %}* [pydata/{{topic}}.ipynb](pydata/{{topic}}.ipynb "{{topic}}")
{% endfor %}
```


## Notebooks

* [pydata/intro.ipynb](pydata/intro.ipynb "intro")
* [pydata/design.ipynb](pydata/design.ipynb "design")
* [pydata/systems.ipynb](pydata/systems.ipynb "systems")
* [pydata/materials.ipynb](pydata/materials.ipynb "materials")
* [pydata/community.ipynb](pydata/community.ipynb "community")
* [pydata/media.ipynb](pydata/media.ipynb "media")
* [pydata/culture.ipynb](pydata/culture.ipynb "culture")




```python
## Slides

{% for topic in topics %}* [pydata/{{topic}}.slides.html](pydata/{{topic}}.slides.html "{{topic}}")
{% endfor %}
```


## Slides

* [pydata/intro.slides.html](pydata/intro.slides.html "intro")
* [pydata/design.slides.html](pydata/design.slides.html "design")
* [pydata/systems.slides.html](pydata/systems.slides.html "systems")
* [pydata/materials.slides.html](pydata/materials.slides.html "materials")
* [pydata/community.slides.html](pydata/community.slides.html "community")
* [pydata/media.slides.html](pydata/media.slides.html "media")
* [pydata/culture.slides.html](pydata/culture.slides.html "culture")




```python
## Building the Presentation

[![Build Status](https://travis-ci.org/tonyfast/powersoften.svg?branch=master)](https://travis-ci.org/tonyfast/powersoften)
```


## Building the Presentation

[![Build Status](https://travis-ci.org/tonyfast/powersoften.svg?branch=master)](https://travis-ci.org/tonyfast/powersoften)



```python
    %%file rise.py
    c.SlidesExporter.reveal_url_prefix="https://cdn.jsdelivr.net/npm/reveal.js@3.5.0"
```


    %%file rise.py
    c.SlidesExporter.reveal_url_prefix="https://cdn.jsdelivr.net/npm/reveal.js@3.5.0"


    Overwriting rise.py



```python
## Convert individual notebooks

    %%bash
    pushd pydata
    jupyter nbconvert --to slides --config rise.py  intro.ipynb 
    jupyter nbconvert --to slides --config rise.py  design.ipynb 
    jupyter nbconvert --to slides --config rise.py  systems.ipynb 
    jupyter nbconvert --to slides --config rise.py  materials.ipynb 
    jupyter nbconvert --to slides --config rise.py  community.ipynb 
    jupyter nbconvert --to slides --config rise.py  media.ipynb 
    jupyter nbconvert --to slides --config rise.py  culture.ipynb
    popd
```


## Convert individual notebooks

    %%bash
    pushd pydata
    jupyter nbconvert --to slides --config rise.py  intro.ipynb 
    jupyter nbconvert --to slides --config rise.py  design.ipynb 
    jupyter nbconvert --to slides --config rise.py  systems.ipynb 
    jupyter nbconvert --to slides --config rise.py  materials.ipynb 
    jupyter nbconvert --to slides --config rise.py  community.ipynb 
    jupyter nbconvert --to slides --config rise.py  media.ipynb 
    jupyter nbconvert --to slides --config rise.py  culture.ipynb
    popd


    ~/build/tonyfast/powersoften/pydata ~/build/tonyfast/powersoften
    ~/build/tonyfast/powersoften


    [NbConvertApp] Converting notebook intro.ipynb to slides
    [NbConvertApp] Writing 270835 bytes to intro.slides.html
    [NbConvertApp] Converting notebook design.ipynb to slides
    [NbConvertApp] Writing 325765 bytes to design.slides.html
    [NbConvertApp] Converting notebook systems.ipynb to slides
    [NbConvertApp] Writing 293703 bytes to systems.slides.html
    [NbConvertApp] Converting notebook materials.ipynb to slides
    [NbConvertApp] Writing 1461256 bytes to materials.slides.html
    [NbConvertApp] Converting notebook community.ipynb to slides
    [NbConvertApp] Writing 347097 bytes to community.slides.html
    [NbConvertApp] Converting notebook media.ipynb to slides
    [NbConvertApp] Writing 443430 bytes to media.slides.html
    [NbConvertApp] Converting notebook culture.ipynb to slides
    [NbConvertApp] Writing 281417 bytes to culture.slides.html



```python
## Create a master notebook.
    
    nb = new_notebook()    
    for topic in topics:
        topic = 'pydata' / Path(topic)
        cells = reads(topic.with_suffix('.ipynb').read_text(), 4).cells
        for i, cell in enumerate(cells):
            if 'slideshow' in cell['metadata'] and cell['metadata']['slideshow']['slide_type'] != 'skip':
                if i>0 and cell['cell_type'] == 'code' and cell['metadata']['slideshow']['slide_type'] =='slide': 
                    cell['metadata']['slideshow']['slide_type'] = 'subslide'
                nb.cells.append(cell)
    nb.cells.append(new_code_cell("import style", outputs=[new_output('display_data', {**{
        'text/html': [_] for _ in [css, rise_src_css]
    }, **{'application/javascript': rise_src_js}})]))
    (topic.parent / Path('index.ipynb')).write_text(writes(nb))
    !jupyter trust pydata/index.ipynb
    !jupyter nbconvert --to slides --config rise.py pydata/index.ipynb 
    !cp pydata/index.slides.html pydata/index.html
```


## Create a master notebook.
    
    nb = new_notebook()    
    for topic in topics:
        topic = 'pydata' / Path(topic)
        cells = reads(topic.with_suffix('.ipynb').read_text(), 4).cells
        for i, cell in enumerate(cells):
            if 'slideshow' in cell['metadata'] and cell['metadata']['slideshow']['slide_type'] != 'skip':
                if i>0 and cell['cell_type'] == 'code' and cell['metadata']['slideshow']['slide_type'] =='slide': 
                    cell['metadata']['slideshow']['slide_type'] = 'subslide'
                nb.cells.append(cell)
    nb.cells.append(new_code_cell("import style", outputs=[new_output('display_data', {**{
        'text/html': [_] for _ in [css, rise_src_css]
    }, **{'application/javascript': rise_src_js}})]))
    (topic.parent / Path('index.ipynb')).write_text(writes(nb))
    !jupyter trust pydata/index.ipynb
    !jupyter nbconvert --to slides --config rise.py pydata/index.ipynb 
    !cp pydata/index.slides.html pydata/index.html


    [TrustNotebookApp] Writing notebook-signing key to /home/travis/.local/share/jupyter/notebook_secret
    Signing notebook: pydata/index.ipynb
    [NbConvertApp] Converting notebook pydata/index.ipynb to slides
    [NbConvertApp] Writing 1840849 bytes to pydata/index.slides.html



```python
    !jupyter nbconvert --to markdown --TemplateExporter.exclude_input=True readme.ipynb
```


    !jupyter nbconvert --to markdown --TemplateExporter.exclude_input=True readme.ipynb


    [NbConvertApp] Converting notebook readme.ipynb to markdown
    [NbConvertApp] Writing 5612 bytes to readme.md


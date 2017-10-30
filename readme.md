
# A presentation of the Powers Of_ten_ for RENCI

November 1, 2017

The Nick and Tony Show


## RIPx Media

## Remote

* [Github](https://github.com/tonyfast/powersoften) useful static interative versions of notebooks
* [Nbviewer](http://nbviewer.jupyter.org/format/slides/github/tonyfast/powersoften/blob/gh-pages/renci/index.ipynb#/) provides interative versions of static notebooks.  `assert \`ing `Javascript and IFrame`s still work 
* [Travis](https://travis-ci.org/tonyfast/powersoften) builds our docs ...
* ... on [Github Pages](https://tonyfast.github.io/powersoften/#/)
* [Binder]()
* [Raw Git](https://cdn.rawgit.com/tonyfast/powersoften/gh-pages/index.html)

## Local

* [localhost](localhost:8888/files/powersoften/index.html)
* [file system](localhost:8888/files/powersoften/index.html)



# Topics

The major `topics = 'intro, design, systems, materials, community, media, culture'.replace(' ','').split(',')`.  



## Notebooks

* [renci/intro.ipynb](renci/intro.ipynb "intro")
* [renci/design.ipynb](renci/design.ipynb "design")
* [renci/systems.ipynb](renci/systems.ipynb "systems")
* [renci/materials.ipynb](renci/materials.ipynb "materials")
* [renci/community.ipynb](renci/community.ipynb "community")
* [renci/media.ipynb](renci/media.ipynb "media")
* [renci/culture.ipynb](renci/culture.ipynb "culture")




## Slides

* [renci/intro.slides.html](renci/intro.slides.html "intro")
* [renci/design.slides.html](renci/design.slides.html "design")
* [renci/systems.slides.html](renci/systems.slides.html "systems")
* [renci/materials.slides.html](renci/materials.slides.html "materials")
* [renci/community.slides.html](renci/community.slides.html "community")
* [renci/media.slides.html](renci/media.slides.html "media")
* [renci/culture.slides.html](renci/culture.slides.html "culture")




## Building the Presentation

[![Build Status](https://travis-ci.org/tonyfast/powersoften.svg?branch=master)](https://travis-ci.org/tonyfast/powersoften)



    %%file rise.py
    c.SlidesExporter.reveal_url_prefix="https://cdn.jsdelivr.net/npm/reveal.js@3.5.0"


    Overwriting rise.py



## Convert individual notebooks

    %%bash
    pushd renci
    jupyter nbconvert --to slides --config rise.py  intro.ipynb 
    jupyter nbconvert --to slides --config rise.py  design.ipynb 
    jupyter nbconvert --to slides --config rise.py  systems.ipynb 
    jupyter nbconvert --to slides --config rise.py  materials.ipynb 
    jupyter nbconvert --to slides --config rise.py  community.ipynb 
    jupyter nbconvert --to slides --config rise.py  media.ipynb 
    jupyter nbconvert --to slides --config rise.py  culture.ipynb
    popd


    ~/powersoften/renci ~/powersoften
    ~/powersoften


    [NbConvertApp] Converting notebook intro.ipynb to slides
    [NbConvertApp] Writing 361410 bytes to intro.slides.html
    [NbConvertApp] Converting notebook design.ipynb to slides
    [NbConvertApp] Writing 284544 bytes to design.slides.html
    [NbConvertApp] Converting notebook systems.ipynb to slides
    [NbConvertApp] Writing 286906 bytes to systems.slides.html
    [NbConvertApp] Converting notebook materials.ipynb to slides
    [NbConvertApp] Writing 1454455 bytes to materials.slides.html
    [NbConvertApp] Converting notebook community.ipynb to slides
    [NbConvertApp] Writing 305994 bytes to community.slides.html
    [NbConvertApp] Converting notebook media.ipynb to slides
    [NbConvertApp] Writing 427931 bytes to media.slides.html
    [NbConvertApp] Converting notebook culture.ipynb to slides
    [NbConvertApp] Writing 280974 bytes to culture.slides.html



## Create a master notebook.
    
    nb = new_notebook()    
    for topic in topics:
        topic = 'renci' / Path(topic)
        cells = reads(topic.with_suffix('.ipynb').read_text(), 4).cells
        for i, cell in enumerate(cells):
            if 'slideshow' in cell['metadata'] and cell['metadata']['slideshow']['slide_type'] != 'skip':
                if i>0 and cell['cell_type'] == 'code' and cell['metadata']['slideshow']['slide_type'] =='slide': 
                    cell['metadata']['slideshow']['slide_type'] = 'subslide'
                nb.cells.append(cell)
    nb.cells.append(new_code_cell("import style", outputs=[new_output('display_data', {'text/html': [css]})]))
    (topic.parent / Path('index.ipynb')).write_text(writes(nb))
    !jupyter trust renci/index.ipynb
    !jupyter nbconvert --to slides --config rise.py --stdout renci/index.ipynb > index.html


    Notebook already signed: renci/index.ipynb
    [NbConvertApp] Converting notebook renci/index.ipynb to slides



    !jupyter nbconvert --to markdown --TemplateExporter.exclude_input=True readme.ipynb


    [NbConvertApp] Converting notebook readme.ipynb to markdown
    [NbConvertApp] Writing 5106 bytes to readme.md


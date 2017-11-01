
# A presentation of the Powers Of_ten_ for RENCI

November 1, 2017

The Nick and Tony Show


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
</style>



    <IPython.core.display.Javascript object>



## RIPx Media

## Remote

* [Github](https://github.com/tonyfast/powersoften) useful static interative versions of notebooks
* [Nbviewer](http://nbviewer.jupyter.org/format/slides/github/tonyfast/powersoften/blob/gh-pages/renci/index.ipynb#/) provides interative versions of static notebooks.  `assert \`ing `Javascript and IFrame`s still work 
* [Travis](https://travis-ci.org/tonyfast/powersoften) builds our docs ...
* ... on [Github Pages](https://tonyfast.github.io/powersoften/#/)
* [Binder](#)
* [Raw Git](https://cdn.rawgit.com/tonyfast/powersoften/gh-pages/renci/index.html)

## Local

* [localhost](localhost:8888/files/powersoften/renci/index.html)
* [file system](localhost:8888/files/powersoften/renci/index.html)



# Topics

The major `topics = 'intro, design, systems, materials, community, media, culture'.\`  

        
        replace(' ','').split(',')



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



# A Presentation for RENCI

November 1, 2017

The Nick and Tony Show

RIPx


<style>
    iframe {
        width: 100%;
        min-height: 80vh;
    }
    body.rise-enabled .code_cell .input,  div.reveal .code_cell .input {
        display: none;
    }
</style>



    %%file config.py
    c.Exporter.preprocessors = ['literacy.Execute']


    Overwriting config.py



# Topics

The major `topics = 'intro, design, systems, materials, community, media, culture'.replace(' ','').split(',')`.  



* [intro.ipynb](intro.ipynb "intro")
* [design.ipynb](design.ipynb "design")
* [systems.ipynb](systems.ipynb "systems")
* [materials.ipynb](materials.ipynb "materials")
* [community.ipynb](community.ipynb "community")
* [media.ipynb](media.ipynb "media")
* [culture.ipynb](culture.ipynb "culture")




    %%file rise.py
    c['livereveal']= {
      "width": 800,
      "height": 600,
    }
#     c.TemplateExporter.exclude_input=True 
    c.SlidesExporter.reveal_url_prefix="https://cdn.jsdelivr.net/npm/reveal.js@3.5.0"


    Overwriting rise.py



## Auto Generate the output

For each topic:

1. Execute notebook.
2. Trust the notebook so we can see iframes and html segments.
3. Convert each notebook to it's own presentation.

> __doit__ would be useful here.

 
    !jupyter nbconvert --to slides --config rise.py  intro.ipynb 
    !jupyter nbconvert --to slides --config rise.py  design.ipynb 
    !jupyter nbconvert --to slides --config rise.py  systems.ipynb 
    !jupyter nbconvert --to slides --config rise.py  materials.ipynb 
    !jupyter nbconvert --to slides --config rise.py  community.ipynb 
    !jupyter nbconvert --to slides --config rise.py  media.ipynb 
    !jupyter nbconvert --to slides --config rise.py  culture.ipynb

    nb = new_notebook()    
    for topic in topics:
        cells = reads(Path(topic).with_suffix('.ipynb').read_text(), 4).cells
        for i, cell in enumerate(cells):
            if 'slideshow' in cell['metadata'] and cell['metadata']['slideshow']['slide_type'] != 'skip':
                if i>0 and cell['cell_type'] == 'code' and cell['metadata']['slideshow']['slide_type'] =='slide': 
                    cell['metadata']['slideshow']['slide_type'] = 'subslide'
                nb.cells.append(cell)
    nb.cells.append(new_code_cell("import style", outputs=[new_output('display_data', {'text/html': [css]})]))
    Path('full.ipynb').write_text(writes(nb))
    !jupyter nbconvert --to slides --config rise.py  full.ipynb


    [NbConvertApp] Converting notebook intro.ipynb to slides
    [NbConvertApp] Writing 272748 bytes to intro.slides.html
    [NbConvertApp] Converting notebook design.ipynb to slides
    [NbConvertApp] Writing 284544 bytes to design.slides.html
    [NbConvertApp] Converting notebook systems.ipynb to slides
    [NbConvertApp] Writing 286906 bytes to systems.slides.html
    [NbConvertApp] Converting notebook materials.ipynb to slides
    [NbConvertApp] Writing 259960 bytes to materials.slides.html
    [NbConvertApp] Converting notebook community.ipynb to slides
    [NbConvertApp] Writing 290412 bytes to community.slides.html
    [NbConvertApp] Converting notebook media.ipynb to slides
    [NbConvertApp] Writing 426615 bytes to media.slides.html
    [NbConvertApp] Converting notebook culture.ipynb to slides
    [NbConvertApp] Writing 280696 bytes to culture.slides.html
    [NbConvertApp] Converting notebook full.ipynb to slides
    [NbConvertApp] Writing 552488 bytes to full.slides.html



## [The Master Static Presentation](index.slides.html)


Create `nb = new_notebook()` so that `nb.cells.extend(` can create
new code cells
                                                      
    [
        new_code_cell(
            
with custom __display_data__
            
        """# {}""".format(topic), outputs=[new_output('display_data', {
            "text/html": [
                
creating an IFrame for __topic__, *.nbconvert.slides.html` is artifact from the __nbconvert__
steps above
                
                IFrame("{}.ipynb".format(topic))._repr_html_()
            ]
        })], 

Make each IFrame their own slide.
            
        metadata=dict(
            slideshow=dict(slide_type=["subslide", "slide"][i is 0])
        )) for _topic in [
            topics[:1], topics[1:3], topics[3:]
        ] for i, topic in enumerate(_topic)])



Append the custom styling we are using in all of the notebooks.

    nb.cells[-1].outputs[0]['data']['text/html'].append(css)
    nb.cells[-1].outputs[0]['data']['text/html'].append("""<style>.code_cell .input {display: none;}</style>""")
    
Write this custom notebook to disk 
    
    Path('index.ipynb').write_text(writes(nb))

Finally, __trust__ and convert the slide.
    
    !jupyter trust index.ipynb
    !jupyter nbconvert index.ipynb 
    !jupyter nbconvert --to slides --SlidesExporter.reveal_url_prefix=https://cdn.jsdelivr.net/npm/reveal.js@3.5.0 index.ipynb 


    Notebook already signed: index.ipynb


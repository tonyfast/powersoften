from os.path import join, dirname
import setuptools


def read(fname):
    with open(join(dirname(__file__), fname)) as f:
        return f.read()

setuptools.setup(
    name="powersoften",
    version="0.0.1",
    author="Tony Fast",
    author_email="tony.fast@gmail.com",
    description="",
    license="BSD-3-Clause",
    keywords="IPython Magic Jupyter",
    url="http://github.com/tonyfast/powersoften",
    packages=setuptools.find_packages(),
    classifiers=[
        "Topic :: Utilities",
        "Framework :: IPython",
        "Natural Language :: English",
        "Programming Language :: Python",
        "Intended Audience :: Developers",
        "Development Status :: 3 - Alpha",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD License",
        "Topic :: Software Development :: Testing",
    ],
    install_requires=[],
    include_package_data=True,
    tests_require=[],
)

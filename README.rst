========
selenium
========

Formulas to setup the Selenium Standalone JAR file

.. note::

    See the full `Salt Formulas installation and usage instructions
    <>`_.

Available states
================

.. contents::
    :local:

``apache``
----------

Downloads and Symlinks the Selenium Standalone JAR file


Example Pillar:

.. code:: yaml
    selenium:
      file_version: '2.43.1'
      dir_version: '2.43'

Dependencies:

* `curl`

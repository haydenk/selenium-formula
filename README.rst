===================
Selenium Standalone
===================

Formulas to setup the Selenium Standalone JAR file

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``selenium``
------------

Downloads and Symlinks the Selenium Standalone JAR file


Example Pillar:

.. code:: yaml
    selenium:
      file_version: '2.43.1'
      dir_version: '2.43'

Dependencies:

* `curl`

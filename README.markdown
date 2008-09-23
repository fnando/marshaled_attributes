marshaled_attributes
====================

A simple plugin for saving marshaled objects using ActiveRecord.

Instalation
-----------

Install the plugin with `script/plugin install git://github.com/fnando/marshaled_attributes.git`

Usage
=====

Considering the following schema:

	create_table :pages do |t|
	  t.string 	:name
	  t.text 	:body
	  t.binary 	:meta
	end

1) Add the method call `marshaled_attributes` to your model.

	class Page < ActiveRecord::Base
	  marshaled_attributes :meta
	end

	@page = Page.new # => do not mass-assign the marshaled attributes.
	@page.meta = {:last_comment_id => 100}

IMPORTANT: Remember NOT to mass-assign the attributes you want to be marshaled.

Copyright (c) 2008 Nando Vieira, released under the MIT license
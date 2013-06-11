# encoding: utf-8

may_register = Register.new(:title => 'Реестр лагерей на май')
may_register.save :validate => false

september_register = Register.new(:title => 'Реестр лагерей на сентябрь')
september_register.save :validate => false

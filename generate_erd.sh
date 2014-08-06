#!/bin/bash

dir=${1%/*}
if [ -d "$dir" ]; then
	cd "$dir"
fi

bundle exec erd --notation=crowsfoot --attributes=content,foreign_keys,primary_keys,inheritance --filename=erd --polymorphism --inheritance

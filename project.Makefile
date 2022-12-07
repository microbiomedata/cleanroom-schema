## Add your own custom Makefile targets here
assets/Cleanroom-schema.pdf: src/cleanroom_schema/schema/cleanroom_schema.yaml
	$(RUN) gen-yuml \
		--directory $(dir $@) \
		--format pdf $<

assets/biosample_relations_test_data.json: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		-o $@ \
		--schema $^

assets/biosample_relations_test_data.ttl: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		-o $@ \
		--schema $^


#assets/experimental_test_data.json: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/in/experimental_test_data.yaml
#	$(RUN) linkml-convert \
#		--target-class ExperimentalContainer \
#		-o $@ \
#		--schema $^
#
#assets/experimental_test_data.db: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/experimental_test_data.json
#	$(RUN) linkml-sqldb dump \
#		--db $@ \
#		--target-class ExperimentalContainer \
#		--schema $^
#
#
#assets/biosample_relations_test_data.yaml: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/biosample_relations_test_data.json
#	$(RUN) linkml-convert \
#		--target-class DataListCollection \
#		-o $@ \
#		--schema $^
#
#assets/test_data.db: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/test_data.json
#	$(RUN) linkml-sqldb dump \
#		--db $@ \
#		--target-class DataListCollection \
#		--schema $^
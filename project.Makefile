## Add your own custom Makefile targets here

RUN = poetry run


assets/Cleanroom-schema.pdf: src/cleanroom_schema/schema/cleanroom_schema.yaml
	$(RUN) gen-yuml \
		--directory $(dir $@) \
		--format pdf $<

assets/biosample_relations_test_data.json: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		--output $@ \
		--schema $^

assets/biosample_relations_test_data.yaml: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/biosample_relations_test_data.json
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		--outpututput $@ \
		--schema $^

assets/biosample_relations_test_data.ttl: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		--output $@ \
		--schema $^


assets/biosample_instances.csv: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		--index-slot biosample_list \
		--output $@ \
		--schema $^

assets/%.tsv: src/cleanroom_schema/schema/cleanroom_schema.yaml src/data/examples/biosample_relations_test_data.yaml
	$(RUN) linkml-convert \
		--target-class DataListCollection \
		--index-slot $(basename $(notdir $@)) \
		--output $@ \
		--schema $^

tsvs: assets/biosample_list.tsv  assets/frs_list.tsv assets/cbfs_list.tsv

#assets/test_data.db: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/biosample_relations_test_data.yaml
#	$(RUN) linkml-sqldb dump \
#		--db $@ \
#		--target-class DataListCollection \
#		--schema $^


test_publishability:
	$(RUN) test_publishability

assets/sheets/cleanroom_classes_rows.tsv: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/in/cleanroom_classes_template.tsv
	$(RUN) linkml2sheets \
		--output $@ \
		--schema $^

assets/sheets/cleanroom_slots_rows.tsv: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/in/cleanroom_slots_template.tsv
	$(RUN) linkml2sheets \
		--output $@ \
		--schema $^

assets/sheets/cleanroom_usage_rows.tsv: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/in/cleanroom_usages_template.tsv
	$(RUN) linkml2sheets \
		--output $@ \
		--schema $^

assets/sheets/cleanroom_schema.yaml: \
assets/in/cleanroom_prefix_rows.tsv \
assets/in/cleanroom_schema_rows.tsv \
assets/sheets/cleanroom_classes_rows.tsv \
assets/sheets/cleanroom_slots_rows.tsv \
assets/sheets/cleanroom_usage_rows.tsv
	$(RUN) sheets2linkml \
		--use-attributes \
		--output $@ $^

#assets/cleanroom_schema_generated.yaml: src/cleanroom_schema/schema/cleanroom_schema.yaml
#	$(RUN) gen-linkml --format yaml --output $@ $<
assets/schemasheets_deepdiff.txt: src/cleanroom_schema/schema/cleanroom_schema.yaml assets/sheets/cleanroom_schema.yaml
	$(RUN) deep diff \
		--exclude-regex-paths "attributes" \
		--exclude-regex-paths "enums" \
		--exclude-regex-paths "from_schema" \
		--exclude-regex-paths "slot_usage" $^ > $@

project/owl/cs.rdf.owl: src/cleanroom_schema/schema/cleanroom_schema.yaml
	$(RUN) gen-owl \
		--format xml \
		--output $@ $<

assets/csrg.ttl: project/owl/cs.rdf.owl
	/home/mark/gitrepos/relation-graph/cli/target/universal/stage/bin/relation-graph \
		--ontology-file $< \
		--output-file $@


CREATE TABLE "DataListCollection" (
	biosample_list TEXT, 
	frs_list TEXT, 
	cbfs_list TEXT, 
	relations_list TEXT, 
	PRIMARY KEY (biosample_list, frs_list, cbfs_list, relations_list)
);

CREATE TABLE "FieldResearchSite" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "ImmaterialEntity" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "MaterialEntity" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "MaterialSample" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "NamedThing" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "PlannedProcess" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Site" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Specimen" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Biosample" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	collected_from TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(collected_from) REFERENCES "FieldResearchSite" (id)
);

CREATE TABLE "CollectingBiosamplesFromSite" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	site TEXT, 
	biosamples TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(site) REFERENCES "FieldResearchSite" (id)
);

CREATE TABLE "ReifiedRelationship" (
	subject TEXT, 
	predicate TEXT, 
	object TEXT, 
	notes TEXT, 
	PRIMARY KEY (subject, predicate, object, notes), 
	FOREIGN KEY(subject) REFERENCES "NamedThing" (id), 
	FOREIGN KEY(object) REFERENCES "NamedThing" (id)
);

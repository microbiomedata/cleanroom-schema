# Auto generated from cleanroom_schema.yaml by pythongen.py version: 0.9.0
# Generation date: 2022-12-07T11:47:32
# Schema: cleanroom-schema
#
# id: https://w3id.org/microbiomedata/cleanroom-schema
# description: Cleanroom reboot of NMDC schema
# license: MIT

import dataclasses
import sys
import re
from jsonasobj2 import JsonObj, as_dict
from typing import Optional, List, Union, Dict, ClassVar, Any
from dataclasses import dataclass
from linkml_runtime.linkml_model.meta import EnumDefinition, PermissibleValue, PvFormulaOptions

from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.metamodelcore import empty_list, empty_dict, bnode
from linkml_runtime.utils.yamlutils import YAMLRoot, extended_str, extended_float, extended_int
from linkml_runtime.utils.dataclass_extensions_376 import dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.formatutils import camelcase, underscore, sfx
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from rdflib import Namespace, URIRef
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.linkml_model.types import String, Uriorcurie
from linkml_runtime.utils.metamodelcore import URIorCURIE

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
CLEANROOM_SCHEMA = CurieNamespace('cleanroom_schema', 'https://w3id.org/microbiomedata/cleanroom-schema/')
LINKML = CurieNamespace('linkml', 'https://w3id.org/linkml/')
SCHEMA = CurieNamespace('schema', 'http://example.org/UNKNOWN/schema/')
DEFAULT_ = CLEANROOM_SCHEMA


# Types

# Class references
class NamedThingId(URIorCURIE):
    pass


@dataclass
class NamedThing(YAMLRoot):
    """
    A generic grouping for any identifiable entity
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = SCHEMA.Thing
    class_class_curie: ClassVar[str] = "schema:Thing"
    class_name: ClassVar[str] = "NamedThing"
    class_model_uri: ClassVar[URIRef] = CLEANROOM_SCHEMA.NamedThing

    id: Union[str, NamedThingId] = None
    name: Optional[str] = None
    description: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, NamedThingId):
            self.id = NamedThingId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        if self.description is not None and not isinstance(self.description, str):
            self.description = str(self.description)

        super().__post_init__(**kwargs)


@dataclass
class DataLists(YAMLRoot):
    """
    A datastructure that can contain lists of instances from any selected classes in the schema
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = CLEANROOM_SCHEMA.DataLists
    class_class_curie: ClassVar[str] = "cleanroom_schema:DataLists"
    class_name: ClassVar[str] = "DataLists"
    class_model_uri: ClassVar[URIRef] = CLEANROOM_SCHEMA.DataLists

    nt_list: Optional[Union[Dict[Union[str, NamedThingId], Union[dict, NamedThing]], List[Union[dict, NamedThing]]]] = empty_dict()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        self._normalize_inlined_as_dict(slot_name="nt_list", slot_type=NamedThing, key_name="id", keyed=True)

        super().__post_init__(**kwargs)


# Enumerations


# Slots
class slots:
    pass

slots.id = Slot(uri=SCHEMA.identifier, name="id", curie=SCHEMA.curie('identifier'),
                   model_uri=CLEANROOM_SCHEMA.id, domain=None, range=URIRef)

slots.name = Slot(uri=SCHEMA.name, name="name", curie=SCHEMA.curie('name'),
                   model_uri=CLEANROOM_SCHEMA.name, domain=None, range=Optional[str])

slots.description = Slot(uri=SCHEMA.description, name="description", curie=SCHEMA.curie('description'),
                   model_uri=CLEANROOM_SCHEMA.description, domain=None, range=Optional[str])

slots.dataLists__nt_list = Slot(uri=CLEANROOM_SCHEMA.nt_list, name="dataLists__nt_list", curie=CLEANROOM_SCHEMA.curie('nt_list'),
                   model_uri=CLEANROOM_SCHEMA.dataLists__nt_list, domain=None, range=Optional[Union[Dict[Union[str, NamedThingId], Union[dict, NamedThing]], List[Union[dict, NamedThing]]]])
{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "uri" => "/repositories",
    "properties" => {
      "uri" => {"type" => "string", "required" => false},

      "repo_code" => {"type" => "string", "maxLength" => 255, "ifmissing" => "error", "minLength" => 1},
      "name" => {"type" => "string", "maxLength" => 255, "ifmissing" => "error", "default" => ""},
      "org_code" => {"type" => "string", "maxLength" => 255},
      "country" => {"type" => "string", "required" => false, "dynamic_enum" => "country_iso_3166"},
      "parent_institution_name" => {"type" => "string", "maxLength" => 255},
      "description" => {"type" => "string", "maxLength" => 65000},
      "url" => {"type" => "string", "maxLength" => 255, "pattern" => "\\Ahttps?:\\/\\/[\\\S]+\\z"},
      "image_url" => {"type" => "string", "maxLength" => 255, "pattern" => "\\Ahttps?:\\/\\/[\\\S]+\\z"},
      "contact_persons" => {"type" => "string", "maxLength" => 65000},

      "publish" => {"type" => "boolean"},

      "display_string" => {"type" => "string", "readonly" => true},
      "oai_is_disabled" => {"type" => "boolean"},
      "oai_sets_available" => {"type" => "string"},

      "slug" => {"type" => "string"},
      "is_slug_auto" => {"type" => "boolean", "default" => true},

      "ark_shoulder" => {"type" => "string"},
      "ark_template" => {"type" => "string", "ifmissing" => "error", "default" => ".zd", "pattern" => "\\A\\.[rsz][de]+k?\\z"},

      "agent_representation" => {
        "type" => "object",
        "subtype" => "ref",
        "properties" => {
          "ref" => {
            "type" => "JSONModel(:agent_corporate_entity) uri",
            "ifmissing" => "error",
            "readonly" => "true"
          }
        }
      },
    },
  },
}

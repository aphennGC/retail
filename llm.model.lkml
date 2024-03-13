connection: "genai_assistant"
label: "LLM"

include: "/**/*.view.lkml"                 # include all views in this project

explore: generate_query {
  label: "EA - Generate Query"
}

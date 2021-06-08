# # Script for populating the database. You can run it as:
# #
# #     mix run priv/repo/seeds.exs
# #
# # Inside the script, you can read and write to any of your
# # repositories directly:
# #
# #     Mijncmd.Repo.insert!(%Mijncmd.SomeSchema{})
# #
# # We recommend using the bang functions (`insert!`, `update!`
# # and so on) as they will fail if something goes wrong.
alias Mijncmd.Repo

## Products

Repo.insert!(%Mijncmd.Product{
    name: "Sketch",
    slug: "sketch",
    description: "Sketch"
  }
)

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Illustrator",
    slug: "adobe-illustrator",
    description: "Adobe Illustrator"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Indesign",
    slug: "adobe-indesign",
    description: "Adobe Indesign"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Photoshop",
    slug: "adobe-photoshop",
    description: "Adobe Photoshop"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe After Effects",
    slug: "adobe-after-effects",
    description: "Adobe After Effects"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Premiere Pro",
    slug: "adobe-premiere-pro",
    description: "Adobe Premiere Pro"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Audition",
    slug: "adobe-audition",
    description: "Adobe Audition"
})

Repo.insert!(%Mijncmd.Product{
    name: "Figma",
    slug: "figma",
    description: "Figma"
})

Repo.insert!(%Mijncmd.Product{
    name: "Lightroom",
    slug: "lightroom",
    description: "Lightroom"
})

Repo.insert!(%Mijncmd.Product{
    name: "Visual Studio Code",
    slug: "visual-studio-code",
    description: "Visual Studio Code"
})

Repo.insert!(%Mijncmd.Product{
    name: "XCode",
    slug: "xcode",
    description: "XCode"
})

Repo.insert!(%Mijncmd.Product{
    name: "Sublime Text",
    slug: "sublime-text",
    description: "Sublime Text"
})

Repo.insert!(%Mijncmd.Product{
    name: "Procreate",
    slug: "procreate",
    description: "Procreate"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe XD",
    slug: "adobe-xd",
    description: "Adobe Experience Design"
})

Repo.insert!(%Mijncmd.Product{
    name: "Blender",
    slug: "blender",
    description: "Blender 3D"
})

Repo.insert!(%Mijncmd.Product{
    name: "Cinema 4D",
    slug: "cinema-4d",
    description: "Cinema 4D"
})

Repo.insert!(%Mijncmd.Product{
    name: "Final Cut Pro X",
    slug: "final-cut-pro",
    description: "Final Cut Pro X"
})

Repo.insert!(%Mijncmd.Product{
    name: "DaVinci Resolve",
    slug: "davinci-resolve",
    description: "Davinci Resolve"
})

Repo.insert!(%Mijncmd.Product{
    name: "Logic Pro X",
    slug: "logic-pro",
    description: "Logic Pro X"
})

Repo.insert!(%Mijncmd.Product{
    name: "Garageband",
    slug: "garageband",
    description: "Garageband"
})

Repo.insert!(%Mijncmd.Product{
    name: "Fruity Loops",
    slug: "fruity-loops",
    description: "Fruity Loops"
})

Repo.insert!(%Mijncmd.Product{
    name: "Abelton",
    slug: "abelton",
    description: "Abelton"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe RAW",
    slug: "adobe-raw",
    description: "Adobe Raw"
})

Repo.insert!(%Mijncmd.Product{
    name: "Storyboarder",
    slug: "storyboarder",
    description: "Storyboarder"
})

Repo.insert!(%Mijncmd.Product{
    name: "Unity",
    slug: "unity",
    description: "Unity"
})

Repo.insert!(%Mijncmd.Product{
    name: "Unreal Engine",
    slug: "unreal-engine",
    description: "Unreal Engine"
})

Repo.insert!(%Mijncmd.Product{
    name: "Autocad",
    slug: "autocad",
    description: "Autocad"
})

Repo.insert!(%Mijncmd.Product{
    name: "Adobe Animate",
    slug: "adobe-animate",
    description: "Adobe Animate"
})

Repo.insert!(%Mijncmd.Product{
    name: "InVision Studio",
    slug: "invision-studio",
    description: "Invision Studio"
})

Repo.insert!(%Mijncmd.Product{
    name: "Webflow",
    slug: "webflow",
    description: "Webflow"
})

## Skills
Repo.insert!(%Mijncmd.Skill{
  name: "UX",
  description: "User experience",
  slug: "ux"
})

Repo.insert!(%Mijncmd.Skill{
  name: "UI",
  description: "User interface",
  slug: "ui"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Web Design",
  description: "Web Design",
  slug: "web-design"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Programmeren",
  description: "programmeren",
  slug: "programmeren"
})

Repo.insert!(%Mijncmd.Skill{
  name: "HTML / CSS",
  description: "html",
  slug: "html-css"
})

Repo.insert!(%Mijncmd.Skill{
  name: "SCSS / Sass",
  description: "Sass",
  slug: "scss-sass"
})

Repo.insert!(%Mijncmd.Skill{
  name: "PHP",
  description: "PHP",
  slug: "php"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Javascript",
  description: "Javascript",
  slug: "javascript"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Vue",
  description: "Vue",
  slug: "vue"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Laravel",
  description: "Laravel",
  slug: "laravel"
})

Repo.insert!(%Mijncmd.Skill{
  name: "React",
  description: "React",
  slug: "react"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Python",
  description: "Python",
  slug: "python"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Java",
  description: "Java",
  slug: "java"
})

Repo.insert!(%Mijncmd.Skill{
  name: "C",
  description: "C",
  slug: "c-lang"
})

Repo.insert!(%Mijncmd.Skill{
  name: "C ++",
  description: "C ++",
  slug: "c-plus-plus"
})

Repo.insert!(%Mijncmd.Skill{
  name: "R",
  description: "R Lang",
  slug: "r-lang"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Go",
  description: "Go",
  slug: "go-lang"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Swift",
  description: "Swift lang",
  slug: "swift"
})

Repo.insert!(%Mijncmd.Skill{
  name: "SwiftUI",
  description: "SwiftUI Framework",
  slug: "swift-ui"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mathlab",
  description: "Mathlab",
  slug: "mathlab"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Ruby",
  description: "Ruby",
  slug: "ruby"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Angular",
  description: "Angular",
  slug: "angular"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Svelte",
  description: "Svelte",
  slug: "svelte"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Elixir",
  description: "elixir",
  slug: "elixir"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Bootstrap",
  description: "Bootstrap",
  slug: "bootstrap"
})

Repo.insert!(%Mijncmd.Skill{
  name: "TailwindCSS",
  description: "TailwindCSS",
  slug: "tailwindcss"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Wordpress",
  description: "Wordpress",
  slug: "wordpress"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Elementor",
  description: "Elementor",
  slug: "elementor"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Squarespace",
  description: "Squarespace",
  slug: "squarespace"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Webflow",
  description: "Webflow",
  slug: "webflow"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Kotlin",
  description: "Kotlin",
  slug: "kotlin"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Typescript",
  description: "Typescript",
  slug: "typescript"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Ubuntu",
  description: "Ubuntu",
  slug: "ubuntu"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Motion Design",
  description: "Motion Design",
  slug: "motion-design"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Logo Design",
  description: "Logo Design",
  slug: "logo-design"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Branding",
  description: "Branding",
  slug: "branding"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Grafisch Design",
  description: "Grafisch Design",
  slug: "grafisch-design"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Fotografie",
  description: "Fotografie",
  slug: "fotografie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Campagne",
  description: "Campagne",
  slug: "campagne"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Styleboard",
  description: "Styleboard",
  slug: "styleboard"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Moodboard",
  description: "Moodboard",
  slug: "moodboard"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Conceptboard",
  description: "Conceptboard",
  slug: "conceptboard"
})

Repo.insert!(%Mijncmd.Skill{
  name: "3D Visualisatie",
  description: "3D Visualisatie",
  slug: "3d-visualisatie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mixed Reality",
  description: "Mixed Reality",
  slug: "mixed-reality"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Storytelling",
  description: "Storytelling",
  slug: "storytelling"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Animeren",
  description: "Animeren",
  slug: "animeren"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Schetsen",
  description: "Schetsen",
  slug: "schetsen"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Scrum",
  description: "Scrum",
  slug: "scrum"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Concept Visualisatie",
  description: "Concept visualisatie",
  slug: "concept-visualisatie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Conceptontwikkeling",
  description: "Conceptontwikkeling",
  slug: "concept-ontwikkeling"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Ondernemen",
  description: "Ondernemen",
  slug: "ondernemen"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Illustreren",
  description: "Illustreren",
  slug: "illustreren"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Onderzoek",
  description: "Onderzoek",
  slug: "onderzoek"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mindfulness",
  description: "Mindfulness",
  slug: "mindfulness"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Meditatie",
  description: "Meditatie",
  slug: "meditatie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Filosofie",
  description: "Filosofie",
  slug: "filosofie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Psychologie",
  description: "Psychologie",
  slug: "psychologie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Rapid Prototyping",
  description: "Rapid Prototyping",
  slug: "rapid-prototyping"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Digitaal minimalisme",
  description: "Digitaal minimalisme",
  slug: "digitaal-minimalisme"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Duurzaamheid",
  description: "Duurzaamheid",
  slug: "duurzaamheid"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Innovatie",
  description: "Innovatie",
  slug: "innovatie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Milieu",
  description: "Milieu",
  slug: "milieu"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Diversiteit",
  description: "Diversiteit",
  slug: "diversiteit"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Toekomst gericht",
  description: "Toekomst gericht",
  slug: "toekomst-gericht"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Levenslange gezondheid",
  description: "Levenslange gezondheid",
  slug: "levenslange-gezondheid"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Waardecreatie",
  description: "Waardecreatie",
  slug: "waardecreatie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Business Model",
  description: "Business model",
  slug: "business-model"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Ondernemingsplan",
  description: "Ondernemingsplan",
  slug: "ondernemingsplan"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Bedrijfsplan",
  description: "Bedrijfsplan",
  slug: "bedrijfsplan"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Marketing / Sales",
  description: "Marketing / Sales",
  slug: "marketing-sales"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mindmap",
  description: "Mindmap",
  slug: "mindmap"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Financien",
  description: "Financien",
  slug: "financien"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Sound Design",
  description: "Sound Design",
  slug: "sound-design"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Componeren",
  description: "Componeren",
  slug: "componeren"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Opnames",
  description: "Opnames",
  slug: "opnames"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Producing",
  description: "Producing",
  slug: "producing"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mixing",
  description: "Mixing",
  slug: "mixing"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Editing",
  description: "Editing",
  slug: "editing"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Mastering",
  description: "Mastering",
  slug: "mastering"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Storyboarding",
  description: "Storyboarding",
  slug: "storyboarding"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Scripting",
  description: "Scripting",
  slug: "scripting"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Film",
  description: "Film",
  slug: "film"
})


Repo.insert!(%Mijncmd.Skill{
  name: "Regie",
  description: "Regie",
  slug: "regie"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Camera / Licht",
  description: "Camera / Licht",
  slug: "camera-licht"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Geluid",
  description: "Geluid",
  slug: "geluid"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Montage",
  description: "Montage",
  slug: "montage"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Documentaire",
  description: "Documentaire",
  slug: "documentaire"
})

Repo.insert!(%Mijncmd.Skill{
  name: "Schrijven",
  description: "Schrijven",
  slug: "schrijven"
})

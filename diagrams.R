library(dplyr)
DiagrammeR::grViz("
digraph inheritance {
  # a 'graph' statement
  graph [overlap = true]
  # several 'node' statements
  node [shape = box,
        fontname = Helvetica,
        width = 0.6,
        fontsize = 7,
        style = filled,
        fillcolor = Grey]
  Package;
  
    node [shape = box,
        fontname = Helvetica,
         width = 0.6,
        fontsize = 7,
        style = filled,
        fillcolor = Grey]
  'pecyn API';
  node [shape = box,
        fixedsize = true,
        width = 1,
        fontsize = 7,
        style = filled,
        fillcolor = Grey] // sets as circles
   'Build binary package';
  
    node [shape = box,
        fontname = Helvetica,
        width = 0.6,
        fontsize = 7,
        style = filled,
        fillcolor = Grey]
  '/src/contrib/';
  
      node [shape = box,
        fontname = Helvetica,
        width = 1,
        fontsize = 7,
        style = filled,
        fillcolor = Grey]
  '/bin/.../contrib/.../';
  
        node [shape = box,
        fontname = Helvetica,
        width = 1.2,
        fontsize = 7,
        style = filled,
        fillcolor = Grey]
  'Recreate PACKAGES file';
  
  Package->'pecyn API'
  'pecyn API'->'/src/contrib/'
  'pecyn API'->'Build binary package'
  'Build binary package'->'/bin/.../contrib/.../'
  '/bin/.../contrib/.../'->'Recreate PACKAGES file'
  '/src/contrib/'->'Recreate PACKAGES file'
  
}") %>%
  DiagrammeRsvg::export_svg() %>%
  charToRaw() %>%
  rsvg::rsvg_png("libs/pecyn_flow.png", width = 1250, height = 3000)

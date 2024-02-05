{ pkgs, ... }: {
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        indent_style = "space";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
      };

      "Makefile" = {
        indent_style = "tab";
      };

      "*.{h,hpp,c,cc,cpp,vert,frag,glsl}" = {
        indent_size = 4;
      };

      "*.{html,css,sass,scss}" = {
        indent_size = 2;
      };

      "*.{js,jsx,json,ts,tsx,mjs,cjs,mts,cts}" = {
        indent_size = 2;
      };

      "*.py" = {
        indent_size = 4;
      };

      "*.{lisp,asd,el,paren}" = {
        indent_size = "none";
        indent_style = "space";
        tab_width = "none";
      };

      "*.{xml,launch,test}" = {
        indent_size = 2;
      };

      "*.{yaml,yml}" = {
        indent_size = 2;
      };

      "*.scala" = {
        indent_size = 2;
      };

      "*.java" = {
        indent_size = 4;
      };

      "*.purs" = {
        indent_size = 2;
      };

      "*.nix" = {
        indent_size = 2;
      };

      "*.proto" = {
        indent_size = 2;
      };
    };
  };
}

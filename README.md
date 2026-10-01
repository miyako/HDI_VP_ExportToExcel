# HDI_VP_ExportToExcel

![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue&logo=4d)
![version](https://img.shields.io/static/v1?label=4D&message=17%20R3%2B&color=blue)
![license](https://img.shields.io/github/license/miyako/HDI_VP_ExportToExcel)

How to import and export Microsoft Excel (`.xlsx`) documents with a **4D View Pro** area.

This is a 4D "How do I" (HDI) example, converted from a binary database to a 4D project and modernised for current 4D versions.

## Features

- Import an `.xlsx` file into a 4D View Pro area (`VP IMPORT DOCUMENT`).
- Export the contents of a 4D View Pro area to `.xlsx` (`VP EXPORT DOCUMENT`).
- Post-export callback: choose to open the exported file in Excel or reveal it on disk.
- Ships with a sample workbook (`Resources/Invoice.xlsx`) to try out.
- Tabbed demo window whose descriptions are stored in a 4D table and shown as styled text.

## Requirements

| Item | Value |
|------|-------|
| 4D | 17 R3 or later (the splash window checks this and warns on older versions) |
| License | 4D View Pro |
| Platforms | macOS, Windows |

## Getting Started

1. Open `Project/HDI_VP_ExportToExcel.4DProject` with 4D.
2. Run the *Demo* menu item (**File > Demo**) if the splash window is not displayed at startup.
3. Click **Demo** on the splash window, then open the sample page.
4. Use **Import xlsx file** to load `Resources/Invoice.xlsx`, edit it, and **Export xlsx file** to save it.

## Points of Interest

- **Import / export** are plain `VP IMPORT DOCUMENT` / `VP EXPORT DOCUMENT` calls. See `Forms/HDI2/ObjectMethods/importxlsx.4dm` and `exportxlsx.4dm`.
- **Export callback**: the export is given a `Formula(AfterExport)` that runs when the file is written and receives a status object (`success`, `errorMessage`). See `Methods/AfterExport.4dm`.
- **On VP Ready**: the import and export buttons stay disabled until the View Pro area fires `On VP Ready`.
- **Remembered folder**: the last folder used for import is stored in `Form.fileFolder` and reused by the export dialog.
- **Sample data**: on startup, empty tables are populated from `Resources/<Table>.4ie` and `.4si` with `IMPORT DATA`.
- **Splash window pattern** (shared by all HDI examples): `00_Start` runs without parameters from the startup methods and menu, re-activates the splash if it is open, or delegates to the application process with `CALL WORKER`. The splash is a non-blocking `DIALOG(...; *)` that passes a `Form` object (title, info, blog, minimum version, license) to the form.
- **Version and license check**: the splash form method compares `Application version` to the minimum version and uses `Is license available` to verify the 4D View Pro license. If a check fails the button becomes **Close** and returns to design mode.
- **Standard actions** in `menus.json` (quit, undo, cut, copy, paste, select all...) instead of one-line wrapper methods.

## Modern 4D Practices Used

- `var` / `#DECLARE` instead of `C_*` declarations.
- Localisation with XLIFF (`:xliff:` in forms and menus, `Localized string` in code): English and Japanese in `Resources/en.lproj` and `Resources/ja.lproj`.
- Light and dark mode via `Project/Sources/styleSheets.css` (`prefers-color-scheme` and `"automatic"` colours).
- macOS Tahoe Liquid Glass button heights (27px) and classic heights (23px) in `styleSheets_mac.css`; Windows heights in `styleSheets_windows.css`.
- Helper and callback methods are marked `invisible` so they do not appear in **Run > Method...**.

## Project Structure

```
Project/Sources/
  Forms/HDI/            splash window (version, license and blog info)
  Forms/HDI2/           demo window with the 4D View Pro area
  TableForms/1/         input and list forms for the INFO table
  Methods/00_Start      startup / splash launcher
  Methods/AfterExport   post-export callback
  menus.json            menu bar
  styleSheets*.css      colour scheme and platform styling
Resources/
  Invoice.xlsx          sample Excel workbook
  INFO.4ie, INFO.4si    sample data for the INFO table
  en.lproj, ja.lproj    XLIFF localisation
```

## References

- Blog post: [Work with XLSX documents using 4D View Pro](https://blog.4d.com/work-with-xlsx-documents-using-4d-view-pro/)
- Original download: [HDI_VP_ExportToExcel.zip](https://download.4d.com/Demos/4D_v17_R3/HDI_VP_ExportToExcel.zip)
- [4D View Pro documentation](https://developer.4d.com/docs/ViewPro/getting-started)
- [VP IMPORT DOCUMENT](https://developer.4d.com/docs/ViewPro/commands/vp-import-document) / [VP EXPORT DOCUMENT](https://developer.4d.com/docs/ViewPro/commands/vp-export-document)
- [CSS in 4D](https://developer.4d.com/docs/FormEditor/stylesheets)

## Origin

Originally a binary `.4DB` example database distributed with 4D 17 R3, converted to a 4D project with 4D 21 and updated with the help of GitHub Copilot.

## License

See [LICENSE](LICENSE).

// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

class SvgView implements vscode.Disposable {
    panel: vscode.WebviewPanel;
    diss: DisposableArray<vscode.Disposable> = new DisposableArray();

    constructor(p: vscode.WebviewPanel) {
        this.panel = p;
    }

    dispose() {
        this.diss.dispose();
    }
}

class DisposableArray<T extends vscode.Disposable> implements vscode.Disposable {
    arr: Array<T> = [];

    dispose() {
        this.arr.forEach(d => d.dispose());
    }
}

let views: DisposableArray<SvgView> = new DisposableArray();
let config = vscode.workspace.getConfiguration("svg");

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand(
        'code-svg.preview',
        () => svgPreviewCommand(context)
    );

    context.subscriptions.push(disposable);
    context.subscriptions.push(views);
}

// This method is called when your extension is deactivated
export function deactivate() {}

function svgPreviewCommand(context: vscode.ExtensionContext) {
    let file = vscode.window.activeTextEditor?.document;
    if (file == undefined) {
        vscode.window.showErrorMessage("No active docuent");
        return;
    }

    let fileName = file.fileName;

    let view = new SvgView(vscode.window.createWebviewPanel(
        'code-svg.preview',
        `Preview ${
            fileName.split('/').at(-1)
        }`,
        vscode.ViewColumn.Beside,
        {
            enableScripts: true,
            retainContextWhenHidden: config.get("preview.retainState"),
        }
    ));

    view.diss.arr.push(vscode.workspace.onDidSaveTextDocument((e) => {
        if (e.fileName == fileName) {
            svgFileChange(e, view);
        }
    }));

    views.arr.push(view);

    view.panel.webview.html = svgPreviewHTML(file);
    view.panel.onDidDispose(() => {
        view.dispose();
        let i = views.arr.indexOf(view);
        views.arr.splice(i, 1);
    });
}

function removeWH(text: string): string {
    return text.replace(/<svg\s(.|\s)*?>/, s => s.replace(/\swidth\s*=\s*"([^"]*(\\")?)*"|\sheight\s*=\s*"([^"]*(\\")?)*"/g, " "));
}

function svgFileChange(file: vscode.TextDocument, view: SvgView) {
    view.panel.webview.postMessage({ action: "update", content: removeWH(file.getText()) });
}

function svgPreviewHTML(file: vscode.TextDocument) {
    // TODO: verify svg ? starts with / regex / extension ?
    let svg = removeWH(file.getText());
    return HTML(`...`);
}

function HTML(content: string, head?: string) {
    return `...`;
}

export interface DroomVanDeDag {
    attribution: Record<string, any>;
    date: string;
    dream: Record<string, any>;
    language: string;
    requestedTheme: string | null;
    scope: string;
}
export interface DroomVanDeDagLoadMatch {
    lang?: string;
    scope?: string;
    theme?: string;
}

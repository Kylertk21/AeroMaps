// turbo@2.3.0 downloaded from https://ga.jspm.io/npm:turbo@2.3.0/bin/turbo

import*as e from"child_process";import*as o from"fs";import*as r from"path";import n from"process";var t=e;try{"default"in e&&(t=e.default)}catch(e){}var s=o;try{"default"in o&&(s=o.default)}catch(e){}var l=r;try{"default"in r&&(l=r.default)}catch(e){}function _nullRequire(e){var o=new Error("Cannot find module '"+e+"'");o.code="MODULE_NOT_FOUND";throw o}_nullRequire.resolve=_nullRequire;var a=n;const c=t;const i=s;const u=l;const p=true;const d=true;function installUsingNPM(){const e=u.dirname("turbo/package");const o={...a.env,npm_config_global:void 0};c.execSync("npm install --loglevel=error --prefer-offline --no-audit --progress=false",{cwd:e,stdio:"pipe",env:o})}function hasPackage(e,o){return!!e[o]||!!e[`node_modules/${o}`]}function getBinaryPath(){const e=a.env.TURBO_BINARY_PATH;if(e){if(i.existsSync(e))return e;console.error(`Turborepo was unable to find the executable specified by TURBO_BINARY_PATH:\n${e}`);console.error();console.error("TURBO_BINARY_PATH is intended for development use-cases. You likely want to unset the environment variable.");a.exit(1)}const o=["darwin","linux","windows"];const r=["64","arm64"];let{platform:n,arch:t}=a;n==="win32"&&(n="windows");const s=t==="x64"?"64":t;const l=n==="windows"?".exe":"";const c=o.includes(n)&&r.includes(s)?`turbo-${n}-${s}/bin/turbo${l}`:null;if(c!==null)try{return _nullRequire(`${c}`)}catch(e){}if(p&&c!==null){console.warn("Turborepo did not find the correct binary for your platform.");console.warn("We will attempt to install it now.");try{installUsingNPM();const e=_nullRequire(`${c}`);console.warn("Installation has succeeded.");return e}catch(e){console.warn("Installation has failed.")}}const f=t==="arm64"&&["darwin","windows"].includes(n)?`turbo-${n}-64/bin/turbo${l}`:null;if(d&&f!==null)try{const e=_nullRequire(`${f}`);console.warn(`Turborepo detected that you're running:\n${n} ${s}.`);console.warn(`We were not able to find the binary at:\n${c}`);console.warn(`We found a possibly-compatible binary at:\n${f}`);console.warn("We will attempt to run that binary.");return e}catch(e){}console.error();console.error("***");console.error();console.error("Turborepo failed to start.");console.error();console.error(`Turborepo detected that you are running:\n${n} ${s}`);if(o.includes(n)){if(!r.includes(s))if(o.includes(n)){console.error();console.error("Turborepo supports your platform, but does not support your processor architecture.");a.exit(1)}else{console.error();console.error("Turborepo does not either of your platform or processor architecture.");a.exit(1)}}else{console.error();console.error("Turborepo does not presently support your platform.");a.exit(1)}if(c!==null){console.error();console.error("***");console.error();console.error(`We were not able to find the binary at:\n${c}`);console.error();console.error("We looked for it at:");console.error(_nullRequire.resolve.paths(c).join("\n"))}if(f!==null){console.error();console.error("***");console.error();console.error(`Your platform (${n}) can sometimes run x86 under emulation.`);console.error(`We did not find a possibly-compatible binary at:\n${f}`);console.error();console.error("We looked for it at:");console.error(_nullRequire.resolve.paths(f).join("\n"))}const b=o.map((e=>r.map((o=>`turbo-${e}-${o}/bin/turbo${e==="windows"?".exe":""}`)))).flat();const h=b.filter((e=>e!==c||e!==c));const m=h.filter((e=>{try{return _nullRequire(e)}catch(e){}}));console.error();console.error("***");console.error();if(m.length>0){console.error("Turborepo checked to see if binaries for another platform are installed.");console.error("This typically indicates an error in sharing of pre-resolved node_modules across platforms.");console.error("One common reason for this is copying files to Docker.");console.error();console.error("We found these unnecessary binaries:");console.error(m.join("\n"))}else{console.error("We did not find any binaries on this system.");console.error("This can happen if you run installation with the --no-optional flag.")}const y=10;const w=o.map((e=>r.map((o=>`turbo-${e}-${o}`)))).flat();try{const e="turbo/package";let o=null;let r=u.join(e,"..","..","package-lock.json");for(let e=0;o!==r&&e<y;e++){try{const e=i.readFileSync(r);const o=JSON.parse(e);const n=o?.dependencies??o?.packages??{};if(hasPackage(n,"turbo")){const e=w.every((e=>hasPackage(n,e)));if(!e){console.error();console.error("***");console.error();console.error(`Turborepo detected that your lockfile (${r}) does not enumerate all available platforms.`);console.error("This is likely a consequence of an npm issue: https://github.com/npm/cli/issues/4828.");let e="";let n="";if(o?.packages[""]?.dependencies?.turbo){e=`@${o.packages[""].dependencies.turbo}`;n=" --save-prod"}else if(o?.packages[""]?.devDependencies?.turbo){e=`@${o.packages[""].devDependencies.turbo}`;n=" --save-dev"}else if(o?.packages[""]?.optionalDependencies?.turbo){e=`@${o.packages[""].optionalDependencies.turbo}`;n=" --save-optional"}console.error();console.error("To resolve this issue for your repository, run:");console.error(`npm install turbo${e} --package-lock-only${n} && npm install`);console.error();console.error("You will need to commit the updated lockfile.")}break}break}catch(e){}let e=u.join(r,"..","..","package-lock.json");o=r;r=e}}catch(e){}console.error();console.error("***");console.error();console.error("If you believe this is an error, please include this message in your report.");a.exit(1)}try{c.execFileSync(getBinaryPath(),a.argv.slice(2),{stdio:"inherit"})}catch(e){e&&e.status&&a.exit(e.status);throw e}var f={};export{f as default};


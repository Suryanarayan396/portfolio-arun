'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "8439beb8b1732c0a2985d22d90c57484",
".git/config": "802b5a47f948a56db9c9c0ba06d201ee",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "40db19502ee572ee96daed5ae27f1fae",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a4d5c3465e2f46190f47ea7c77f5a97e",
".git/logs/refs/heads/gh-pages": "a4d5c3465e2f46190f47ea7c77f5a97e",
".git/logs/refs/remotes/origin/gh-pages": "fae7aecea628f07791d9bb440b94fba2",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/06/90aa9b733dd5afc0ea49c30006aad9f4f13ae4": "16286d702969f63591981daacae664a6",
".git/objects/0b/9fcf3d6c6058acc662279d9d22099086a0c78a": "0f20d8b31472ed851f3506e98bb44282",
".git/objects/0f/c564e0ffec2f38f577610817e0d31a9964dcb8": "39eabd5887c98aa7e889a7e11ace06f4",
".git/objects/12/6e702b1507ba1d69c71747e989228300bf853f": "3cd17201cb1fff395b8181d9d8ae76bb",
".git/objects/17/ef8a453d736aa007134a8957c5f59220808db2": "e0e8c8efbfa554277d7c9d88545efce9",
".git/objects/18/faa8ca00856453f2fcc89f8d862267ea7836f2": "2839945434bb7575421d5d8296e7c0cf",
".git/objects/1c/2ab3535ab80d7fc66fd2284ec26ffe66d885ab": "1da1b58127ed0568c1ecd4ac2123ffba",
".git/objects/1d/9f69a6bae99b3a317923695db7bd8c6ae64a49": "4e807b91c5bdbf98e81788aa3a26b4a7",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/1f/4bd7e1c86d20e9157293a0c98e2e107c648876": "18a808404422d1dde13d65ac665dea99",
".git/objects/21/d5ed02a46caa2ab97e47312c9de2c6c212a267": "dae3801b5d5e590a9f6d1d1faeeb3661",
".git/objects/22/8a700c30cff0dff76382cffa58383300089d90": "b6aee0d29099ee4783af94bd99b0744e",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/2e/804300b19568d509e834deceaa1617c9ecc239": "7ae4be572ca9ec92cf887724bca7e79c",
".git/objects/31/906e4a329886217b562a3589a0a025e40c528c": "01916e7803866bcfdccc72c7fcf362f8",
".git/objects/34/0820cad2f3f01d34bd5e853a30206974fc7b2b": "e038179b46c1b1734054db6854a511bd",
".git/objects/34/6b5119b2504758461ec0d86e25ff70e35efbb6": "21d316de13589ff1b30a47645bb5cf65",
".git/objects/3a/b32693391a3c555df60a83234d1625b36240a7": "3670305a6a64bf38cbc1370a9e2bafb0",
".git/objects/3b/b3daab3ac7eddb98a3aa4979b69188b15b8ac4": "c4f61fc9b3e7e51b4627f7a14decb8f3",
".git/objects/3b/f4be9b4d1e9e9e74c4e9f00586665f57c3df99": "67236c55b98df3525d12ad34b5d5615a",
".git/objects/40/aaceb1f052a5554abee72e6d79a0904b1bbeef": "73b761bd66b3ef228da2afb478ab8e4c",
".git/objects/4c/1c9bc0def6dfeffce4d8adaaa44286796d2dad": "30609ab711c750070a33536aad445f77",
".git/objects/50/2df84cbb475ae343106c67d7dbff332f7d46bf": "a15cdf74e1cc59376ae58ff261ea7f31",
".git/objects/50/8084f009217ed01bf54bfbf7889dadff85eb04": "bc47991a012f10b9c4e31f72e1ae7400",
".git/objects/59/4fa254ff8df90928a86d2f26d739336592edfe": "79a4c9ff19e8ba3d661f37400dd4367a",
".git/objects/5e/5a6fe1f84ace7683d891271c45184a88a7d0f6": "0894ae640e5e4f82fa531646e5db4a96",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/5e/f833d7f181b5575b03e06a60215d652532c3ab": "fdaaa2a9079e51b11052a4d4f38bf98c",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/6a/4e6274abdfde9d5666eb701245b018c4e70736": "52bb74c1c447ec9ae94f1d01f2deb168",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/76/0584705850f13a23599eb135f78ab168da022c": "fc93f0fe3e8134044e77015e4fb255ec",
".git/objects/78/bc44e03c080c2053b2f1c0e5040dbceb59832f": "5067ddc628e0a6980bd5f0723184a20c",
".git/objects/80/b30e395e75a26f253fc19e24814754e2dc8bbe": "c200824b171701d51be50f6b05160366",
".git/objects/82/1368971b06a34d486b6e58178e526ac4d92ab0": "5437837e6a14707ebd2537216b8d0ef8",
".git/objects/83/349f7f7ba5d93f968ce0725506583fedca5fac": "1280dc09c36e5cf18b71760f9b65ecb2",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/86/03d0a3d2a91580f77171968c7d13e73fd1482a": "dc750bd17c929d834d260dd7dc0293e7",
".git/objects/87/c9cbbf4e3e8350f110933bea3c16438c8a7f8d": "cd764e7dfd8cc3c9ad11c4fb7981cef7",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/90/87afd982262c4983d418bb3c9de85249a4c285": "986870b790ad13b0cf84c3185650d874",
".git/objects/90/e1c39dd2e109614119a51d8c9655ef305b810c": "dc7cc82d8c0d9ccce02ba5885a578046",
".git/objects/96/01e43aba1651217c4f203b7282005e804b51a3": "a9647309dce92b5e47c1310ba5915cb7",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/98/fb5368847d9c4cf903d6ff88ccdad4e485da90": "b4407415dc6876accaa75c028985e119",
".git/objects/9b/2f3d03fd868c05d0f338bed3a155d128b9ec35": "8df12e9a7f98aff9b164d5328c4c4052",
".git/objects/9e/9bc129e8e0790340fb379dd77e8e3228fee052": "fcf8c998d9b90201d4808031a3584912",
".git/objects/a3/6c7ca647629fe1664773598d4fc9250ac05063": "a5d1c654c2987882fdf2db78f1d37440",
".git/objects/ae/d68e4c0689067c7b74fe3d3412e32380a4b391": "e172dd900559e000e133e75736881918",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/af/60ce2b859107128b63791b3747ea109bfad2e1": "37fc3214afe151e1bd88a88551d5446a",
".git/objects/b0/36998046177bf9035bab2975f8422b243f8c9d": "ab71a81e6e986a15ad248a0b088be102",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b4/7d1807a794b70b45fcaedad88957310344be79": "091eb2e215512970c96375a9d2821c8c",
".git/objects/b5/1fdd9dc2623825f59509752798e39ffaa3de1e": "4edcb0d59ca4f99eacf36e7fbcf2c3e3",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c4/89ac170a5985b5d673e885727b109116c1ecff": "b64f7c07d09d408b3d774edfe7d4d67b",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c8/441d88ec8545904612ccd3900466e263c779cf": "a206cb5990c8b7490e34428a96f74bc1",
".git/objects/cd/49e36c6a26491207eeb14d8c89bb56e749c501": "5ece65929bd1fc2ce932021f9b14f596",
".git/objects/ce/e3c5bb4ad9ca1b7e02e3391cc1cbba998308b7": "8e23cc0d8eea61c17a30b19ec3ccb417",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/674913bec5a1ecddadeff75b9bf3cb4a821266": "8d09fd5346b66cdac487fb594b9434df",
".git/objects/e0/7797437d096064bd90c373800dcb0f335c14b0": "16f9b9defb16491f8c733b09b022688c",
".git/objects/e0/fb7fd9be85410062d40241f817a10feba6d323": "e10324807afa0a851de1fcf5481742ac",
".git/objects/e1/a2618eb5836a831278cbd96ce66a16608eba61": "c06a06d9e8556ec011937b4abf6b957a",
".git/objects/e3/8f064bb682d64df8a42af6605ece0e79d256f2": "6e67c6d6bd2bee5978fce10e41181e14",
".git/objects/e7/07282d485621936122c74aee35ffc355268370": "3e590a51c9633533aa5ab1518b4db031",
".git/objects/e9/979c602eba8a50959121fc17782d7c7e4c519c": "0ba691b253ce4394d3f1d62285a76091",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/f0/b1f06738d21cbc97d5893ed8bcfdb9464e1153": "39bbc7f6d29f0150656b800ab4ad31a4",
".git/objects/f1/1d11b5115aa2fff0650c5f17952d7b79febeb3": "55f6921d6038935f50f52bb9298bf766",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f4/f4d29891df5ec34fbccbab05204de50da7fdae": "745758fe7957059a5137ba45931c3e50",
".git/objects/f5/513d3a7fa38aef0804717e1af319192a48bdf3": "33acb62486d0330057912a9491a5a9d1",
".git/objects/f8/ffa0f5d5932b79a1207eeb29ea9594f3fcffdf": "194748e21d5cff49b45f2e7c9580c379",
".git/objects/ff/22195c73a8d7d5a968043300bbf88c68e2328f": "7d157bb8f8913e5148173b76c8964d1f",
".git/refs/heads/gh-pages": "75a1a98f269b7ac70891b62e508e2d18",
".git/refs/remotes/origin/gh-pages": "75a1a98f269b7ac70891b62e508e2d18",
"assets/AssetManifest.bin": "016aebc7f77685d0af77e3dd48d71b5c",
"assets/AssetManifest.bin.json": "b00327fc7244ec885948a35fa30b1444",
"assets/AssetManifest.json": "6d85d29ac5283b5ef929599d01379c81",
"assets/assets/images/arun%2520poster.png": "2489e0422cbe06588540445ddcc59e8a",
"assets/assets/images/arun_poster-removebg-preview.png": "3f0af107d63395738a731c1a4e055df1",
"assets/assets/images/bg%2520word.png": "75ae22fc2605a9acf1475faee57cd5f8",
"assets/assets/images/fff.png": "d0f7628bc3e3ebdc7515625bafaa7747",
"assets/assets/images/Frame%252034706.png": "1a0d9bb2b39f641c81ceffbd80defdb0",
"assets/assets/images/photo%2520website.png": "3e5f864ffd545a3e1183ed6903d0cfa4",
"assets/assets/png/Adobe%2520illustartor%2520logo.png": "085a9fde47b1c5d83de68d6e3ac8e565",
"assets/assets/png/Adobe%2520XD%2520logo.png": "d50f9c47505a64dcad359886c578225c",
"assets/assets/png/Appium%2520logo.png": "e51b440b60ae1053d51650996f40edae",
"assets/assets/png/Canva%2520logo.png": "36c445406a183987a34ad26a3126e378",
"assets/assets/png/CorelDraw%2520logo.png": "4ed33818f00892e9803ecdd0a499551f",
"assets/assets/png/Creatie%2520AI%2520Logo.png": "09ef3aa67deaca9435b40ef99f8eef52",
"assets/assets/png/design%2520abstract%25202.png": "5b612c68c051099895aafde467206598",
"assets/assets/png/Figma%2520logo.png": "32f5026e1d2f9700c5899418d41d98d9",
"assets/assets/png/Frame%252057.png": "61b8508f0b04d3e113721c674096f0d2",
"assets/assets/png/Frame%252068.png": "2a0688dcb761c460b9f2c776ba0a6d30",
"assets/assets/png/Frame%252069.png": "bc9858b2de174d347b20218dc978697f",
"assets/assets/png/Freshday%2520cart%2520automation.png": "1640abb134f74f50924d7d8d874e0069",
"assets/assets/png/Graphic%2520design.png": "39ac5adb757d74ce619f7e9ee2fde98d",
"assets/assets/png/Landing%2520page.png": "bc5b17d279b82b4e380527240a1570dc",
"assets/assets/png/logo.png": "5d69d8dda07df9985685ea3c98e00964",
"assets/assets/png/Mobile%2520APP%2520design.png": "0a85e53334fa5bb2bcad2017688f14fe",
"assets/assets/png/Mobile%2520APP%2520design2.png": "a926cb051b25087ed6253fa37b88c4e4",
"assets/assets/png/Photoshop%2520Logo.png": "32a0f1013124f4c7100562db6a037152",
"assets/assets/png/Postman%2520Logo.png": "5aa4899ce94219c1913820d5be9a1699",
"assets/assets/png/product%2520desiging%2520thumbnail.png": "bb97644d110060942a2e2540403ae6fa",
"assets/assets/png/Selenium%2520logo.png": "c6cfa57eb37cca2c00cd09c524ae5700",
"assets/assets/png/Sketch%2520app%2520logo.png": "bf97dc0e9b06b6ad69070fea56c64435",
"assets/assets/png/Webflow%2520logo.png": "df46045973a0bbfccdc9e318d52087fc",
"assets/assets/resume/ARUN%2520KUMAR%2520CV.pdf": "87356ae108877dec586744b1ca9f8b41",
"assets/assets/resume/Arun_Kumar_Resume.pdf": "aa5db4556e84aa7f0f14dcc6b9470fbf",
"assets/assets/resume/README.md": "2e48aa4f080bb03e4e9cb91b0945e638",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "5a1ebdb5a512c56b4a407335cb528ed5",
"assets/NOTICES": "468899ca9ceacd1e1dc62826ce6dd7cf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c5055bd11be742892cb51860cf9b2e9b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "7754ca7041ce4eee9818f37b7b43dcba",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ef701d43f127817ff39d6e731c17d2a2",
"/": "ef701d43f127817ff39d6e731c17d2a2",
"main.dart.js": "2cad614abfaa501cf6991f6fd572a17e",
"manifest.json": "7bd6c0c8f489e00f0922501e4ea158a8",
"version.json": "cad8b43427d9f12b9345633d4f336cfc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

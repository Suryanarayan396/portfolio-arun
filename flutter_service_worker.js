'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "016aebc7f77685d0af77e3dd48d71b5c",
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
"flutter_bootstrap.js": "19afc82fb9b12a65e93b7a1bb75fceb3",
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

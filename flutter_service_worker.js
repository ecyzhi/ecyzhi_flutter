'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a0ab091416a5fd3867055b2e9aa06969",
"assets/AssetManifest.bin.json": "63bd8b37396ce277ff772943916e2912",
"assets/AssetManifest.json": "f404e35dbcf4f1d2491d2747f610ddd0",
"assets/assets/fonts/Nunito-Black.ttf": "e30379228b51416f67dbc6f68965bf08",
"assets/assets/fonts/Nunito-BlackItalic.ttf": "c3f7dc7cbdfb0754658cc70e41c6385f",
"assets/assets/fonts/Nunito-Bold.ttf": "9772667f53d0a85e7b09b879821ef01b",
"assets/assets/fonts/Nunito-BoldItalic.ttf": "29a701ee72040e00b48f6c553505b3ac",
"assets/assets/fonts/Nunito-ExtraBold.ttf": "12713ce2dfcef8d25e16664da403a130",
"assets/assets/fonts/Nunito-ExtraBoldItalic.ttf": "c1c20eb847c9e1605af3c8b1ecefdd22",
"assets/assets/fonts/Nunito-ExtraLight.ttf": "d4fdd35188a140cd8bc11a53f49a8d6f",
"assets/assets/fonts/Nunito-ExtraLightItalic.ttf": "b232c7d149f498f1215c59557e78e657",
"assets/assets/fonts/Nunito-Italic.ttf": "fc1d3cbb6812f04359588fcb5c1842ed",
"assets/assets/fonts/Nunito-Light.ttf": "b156cb385240dd7ef80df5181313125e",
"assets/assets/fonts/Nunito-LightItalic.ttf": "43fe69699aa7c354a8b136343ccd0379",
"assets/assets/fonts/Nunito-Medium.ttf": "b500fbae7078c1679bf7c67e59575953",
"assets/assets/fonts/Nunito-MediumItalic.ttf": "5efcb3415349690fc7b9fe37851e6a2d",
"assets/assets/fonts/Nunito-Regular.ttf": "2cd487d187b602d1fa522f8af05f1fbd",
"assets/assets/fonts/Nunito-SemiBold.ttf": "1daa68f825ef4e54773c787b70678647",
"assets/assets/fonts/Nunito-SemiBoldItalic.ttf": "8fd7e136d3306af583b8b4c39b8ed0f4",
"assets/assets/images/blogs/card_6.gif": "63d8f4b6b06ff8a88fb2904638cfed3b",
"assets/assets/images/bootstrap_logo.svg": "0fbafbe7451483ab48bf739ce2f85cae",
"assets/assets/images/css_logo.svg": "4f47b14e84df6d68821764170b004b9b",
"assets/assets/images/curve_negative.svg": "71ce847cae15d75553032546d01c7f8a",
"assets/assets/images/dart_logo.svg": "86f0a4f78662eca3afd20e44dab5534a",
"assets/assets/images/dotnet_logo.svg": "37258a983459ae1c2e4f1e551665f388",
"assets/assets/images/flutter_logo.svg": "e71292ea671dfd06625787623b4c4871",
"assets/assets/images/github.svg": "51a0c2d527d3a198d10766ad05ca472b",
"assets/assets/images/html_logo.svg": "f618641c78751b81086e2cd729ddb296",
"assets/assets/images/js_logo.svg": "f2bd0c0cb064f241f93ab02be9e524b0",
"assets/assets/images/linkedin.svg": "906c3e112ad26b7a370d79fbc6366665",
"assets/assets/images/nodejs_logo.svg": "89ccb09060a7adf788ea2340c54d6d78",
"assets/assets/images/waves_opacity.svg": "43c97b05639c074998f08b493099d835",
"assets/assets/images/works/ai_tee_website_screenshot.jpeg": "17814e32592d6ceb032ea669f8d71947",
"assets/assets/resume/Resume.pdf": "a1d8631d5226a93571b351f9a686e97d",
"assets/FontManifest.json": "2f8268f0dfce0198d177a9b3ceaa8b12",
"assets/fonts/MaterialIcons-Regular.otf": "5cae41dcf43dc94e4557e90f185e7206",
"assets/NOTICES": "ce3c8f95f8dc9b270367c8ab40a11cc1",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4951ffbefb1a41a585f0b8d6c2b9bc68",
"/": "4951ffbefb1a41a585f0b8d6c2b9bc68",
"main.dart.js": "a042f69b3c0348d9d5443ada47cba94f",
"manifest.json": "c0d7546c69ddd3bc2de4d33014dab49e",
"version.json": "3e1ce418c2ea843ec9d5877f5cb7429e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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

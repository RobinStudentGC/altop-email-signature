<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>

<body
  style="font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 0; padding: 0; box-sizing: border-box; background: #f6f6f6;">

  <div class="handtekening-block" style="width: 100%; box-sizing: border-box;">
    <div class="handtekening-verzender-content"
      style="width: 100%; display: flex; justify-content: space-between; flex-wrap: wrap;">
      <div class="verzender-cell" style="padding: 10px 20px 10px 20px; font-size: 1em; box-sizing: border-box;">
        Met vriendelijke groet,<br /><br />
        <strong>(Naam verzender)</strong><br />
        (functie)<br /><br /><br />
      </div>

      <div class="logo-cell"
        style="width: 100%; max-width: 200px; display: flex; align-items: center; justify-content: center; padding: 0; box-sizing: border-box;">
        <img class="base-img" data-src="http://docker07.ap.altop:5194/images/Logo%20AltopT.png" alt="Altop Logo"
          style="max-width: 200px; width: 100%; height: auto; display: block; margin: auto; object-fit: contain; padding-right: 10px;" />
      </div>
    </div>

    <div class="balk" style="width: 100%;">
      <img class="base-img" data-src="http://docker07.ap.altop:5194/images/Balk.png" alt=""
        style="width: 100%; display: block; margin: auto; height: auto;" />
    </div>

    <div class="verzender-nummer" style="padding: 10px 20px; font-size: 1em; box-sizing: border-box;">
      (telefoonnummer verzender)
    </div>

    <div class="informatie-container"
      style="position: relative; width: 100%; height: 168px; box-sizing: border-box;">
      <!-- Replace background div with an <img> for better email support -->
      <img class="background-img" data-src="http://docker07.ap.altop:5194/images/AdresVlak.png"
        style="position: absolute; top: 0; right: 0; width: 100%; height: 100%; object-fit: contain; z-index: 1; pointer-events: none;" />
      <div class="informatie-block" style="font-size: 1em; position: relative; z-index: 2; color: white;">
        Stirlingstraat 4<br />
        7037 DG Beek (Montferland)<br />
        +31 (0)316 82 00 20<br />
        www.altoptechnologies.com<br />
      </div>
    </div>
  </div>

  <script>
    async function toBase64(url) {
      try {
        const res = await fetch(url, { mode: 'cors' });
        const blob = await res.blob();
        return new Promise(resolve => {
          const reader = new FileReader();
          reader.onloadend = () => resolve(reader.result);
          reader.readAsDataURL(blob);
        });
      } catch (e) {
        console.error("Failed to fetch:", url, e);
        return url; // fallback to original URL
      }
    }

    async function convertImages() {
      // Convert all <img> tags with class "base-img" or background-img
      const imgs = document.querySelectorAll('.base-img, .background-img');
      for (let img of imgs) {
        const src = img.dataset.src;
        if (!src) continue;
        try {
          const base64 = await toBase64(src);
          img.src = base64;
        } catch (e) {
          console.error("Failed to convert", src, e);
        }
      }
    }

    window.addEventListener('load', convertImages);
  </script>
</body>

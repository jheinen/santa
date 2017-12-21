using GR

N = 600

x = rand(N)
y = rand(N)
d = round.(Int, rand(N))
s = (0.8 .* rand(N) .+ 0.2) ./ N
w, h, img = readimage("santa.png")
w2, h2, img2 = readimage("logo.png")

function drawsnowflakes(minsize, maxsize)
  for i in 1:N
    if minsize / N  < s[i] <= maxsize / N
      setmarkersize(N * s[i])
      polymarker([x[i]], [y[i]])
    end
  end
end

setviewport(0, 1, 0, 1)
setmarkertype(-1)
setmarkercolorind(0)
setfillcolorind(1)
setfillintstyle(1)
setcharheight(0.06)
setcharup(-0.1, 1)
settextcolorind(6)
settextalign(2, 3)

sx = -1
sy = 0

while sx < 2
  clearws()
  fillrect(0, 1, 0, 1)
  drawsnowflakes(0.2, 0.8)
  if sx < 1
    drawimage(sx, sx+1, sy, sy+h/w, w, h, img)
  else
    drawimage(0.3, 0.7, 0, 0.4, w2, h2, img2)
  end
  text(sx-0.5, sy+0.2, "Merry Christmas\nand Happy New Year")
  drawsnowflakes(0.8, 1)
  sx += 0.01
  sy += 0.002
  for i in 1:N
    if d[i] == 0
      x[i] += s[i] * rand()
    else
      x[i] -= s[i] * rand()
    end
    y[i] -= s[i] * 10 * rand()
    if x[i] > 1 + s[i] || x[i] < -s[i] || y[i] < -s[i]
      x[i] = rand()
      y[i] = 1
    end
  end
  updatews()
end

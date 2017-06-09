require 'opengl'
require 'glu'
require 'glut'
require 'chunky_png'
require 'wavefront'

require_relative 'model'

include Gl
include Glu
include Glut

FPS = 60.freeze
DELAY_TIME = (1000.0 / FPS)
DELAY_TIME.freeze

@movement1 = 0.0
@godown1 = 0.0
@movement2 = 0.0
@godown2 = 0.0
@movement3 = 0.0
@godown3 = 0.0
@movement4 = 0.0
@goup4 = 0.0
@movement5 = 0.0
@goup5 = 0.0
@movement6 = 0.0
@goup6 = 0.0
@movementLego = 150.0
@blackhole_x = -50
@blackhole_y = 0
@blackhole_z = 0
@blackhole_grows = 10.0
@camaramove = 0.0
@moveTF = -450.0
@change = true

def load_objects
  puts "Loading blackhole"
  @blackhole = Model.new('obj/redsaturn', 'obj/redsaturn.mtl')  
  puts "Loading Lego"
    #lego_man
  @lego_man = Model.new('obj/planet', 'obj/planet.mtl')
  puts "Loading planet 1 model"
  @planet1 = Model.new('obj/mysticplanet', 'obj/mysticplanet.mtl')
  puts "Loading planet 2 model"
  @planet2 = Model.new('obj/explotionPlanet', 'obj/explotionPlanet.mtl')
  puts "Loading planet 3 model"
  @planet3 = Model.new('obj/saturn1', 'obj/saturn1.mtl')
  puts "Loading planet 4 model"
  @planet4 = Model.new('obj/planetGreyAndGold', 'obj/planetGreyAndGold.mtl')
  puts "Loading planet 5 model"
  @planet5 = Model.new('obj/cloudplanet', 'obj/cloudplanet.mtl')
  puts "Loading planet 6 model"    
  @planet6 = Model.new('obj/planet2', 'obj/planet2.mtl')
  puts "model loaded"
  @planet7 = Model.new('obj/ironplanet', 'obj/ironplanet.mtl')
  puts "model loaded"
  @planet8 = Model.new('obj/cubessaturn', 'obj/cubessaturn.mtl')
  puts "model loaded"
  @tie_fighter = Model.new('obj/tiefighter4', 'obj/tiefighter4.mtl')
  @planet7Explotes = Model.new('obj/explotionPlanet', 'obj/explotionPlanet.mtl')
end

def initGL
  glDepthFunc(GL_LEQUAL)
  glEnable(GL_DEPTH_TEST)
  glClearDepth(1.0)  
  glClearColor(0.0, 0.0, 0.0, 0.0)
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

  glEnable(GL_LIGHTING)
  glEnable(GL_LIGHT0)
  glEnable(GL_COLOR_MATERIAL)
  glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
  glEnable(GL_NORMALIZE)
  glShadeModel(GL_SMOOTH)
  glEnable(GL_CULL_FACE)
  glCullFace(GL_BACK)    
 
  light_position = [0.0, 50.0, 100.0]
  light_color = [1.0, 1.0, 1.0, 1.0]
  specular = [1.0, 1.0, 1.0, 0.0]
  ambient = [0.15, 0.15, 0.15, 1.0]
  glLightfv(GL_LIGHT0, GL_POSITION, light_position)
  glLightfv(GL_LIGHT0, GL_DIFFUSE, light_color)
  glLightfv(GL_LIGHT0, GL_SPECULAR, specular)
  glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient)
end

def draw
  @frame_start = glutGet(GLUT_ELAPSED_TIME)
  check_fps
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

  glPushMatrix
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(5.0, 5.0, 5.0)
    glTranslate(@movementLego, 0.0, 0.0)
    if(@movementLego > 0)
        @movementLego-=0.5
    end    
    @lego_man.draw
  glPopMatrix
    
  glPushMatrix
    glTranslate(@blackhole_x, @blackhole_y, @blackhole_z)
    glRotatef(@spin, 0.0, 1.0, 0.0)
    glScalef(@blackhole_grows, @blackhole_grows, @blackhole_grows)
    @blackhole_grows+=0.05 #0.02
    @blackhole.draw        
  glPopMatrix
    
  glPushMatrix 
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(11.0, 11.0, 11.0)
    glTranslate(@movement1, @godown1, 0.0)
    if(@movement1 < 40)
        @movement1+=0.25
    end
    if(@godown1 < 10)
        @godown1+=0.08
    end
    @planet1.draw
  glPopMatrix
    
  glPushMatrix
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(10.0, 10.0, 10.0)
    glTranslate(@movement2, @godown2, 0.0)
    if(@movement2 < 50)
        @movement2+=0.22
    end
    if(@godown2 < 20)
        @godown2+=0.1
    end
    @planet2.draw
  glPopMatrix
    
  glPushMatrix
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(10.0, 10.0, 10.0)
    glTranslate(@movement3, @godown3, 0.0)
    if(@movement3 < 60)
        @movement3+=0.08
    end
    if(@godown3 < 30)
        @godown3+=0.05
    end
    @planet3.draw
  glPopMatrix
    
  glPushMatrix    
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(10.0, 10.0, 10.0)
    glTranslate(@movement4, @goup4, 0.0)
    if(@movement4 < 70)
        @movement4+=0.1
    end
    if(@goup4 > -20)
        @goup4-=0.08
    end
    @planet4.draw
  glPopMatrix
    
  glPushMatrix
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(10.0, 10.0, 10.0)
    glTranslate(@movement5, @goup5, 0.0)
    if(@movement5 < 80)
        @movement5+=0.12
    end
    if(@goup5 > -30)
        @goup5-=0.05
    end
    @planet5.draw
  glPopMatrix
  
  glPushMatrix   
    glTranslate(-50.0, 0.0, 0.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(30.0, 30.0, 30.0)
    glTranslate(@movement6, @goup6, 0.0)
    if(@movement6 < 90)
        @movement6+=0.1
    end    
    if(@goup6 > -40)
        @goup6-=0.05
    end
    @planet6.draw
  glPopMatrix
    
  glPushMatrix   
    glTranslate(350.0, 350.0, -50.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(30.0, 30.0, 30.0)        
    if(@change)        
        @planet7.draw            
    else 
        @planet7Explotes.draw            
    end
    
  glPopMatrix
    
  glPushMatrix   
    glTranslate(-500.0, 350.0, -50.0)
    glRotatef(-@spin, 0.0, 1.0, 0.0)
    glScalef(35.0, 35.0, 35.0)        
    @planet8.draw
  glPopMatrix
    
  glPushMatrix   
    
    glTranslate(@moveTF, 320.0, -50.0)
    glRotatef(-90, 0.0, 1.0, 0.0)
    glScalef(12.0, 12.0, 12.0)            
    if(@change)
        if(@moveTF <= 345)
            @moveTF+=1            
        end     
    else
        if(@moveTF > -480)
            @moveTF-=1            
        end     
        
    end
    
    if(@moveTF >= 345)
            @change = false
    end
    @tie_fighter.draw
  glPopMatrix      
    

  glutSwapBuffers
end

def reshape(width, height)
  glViewport(0, 0, width, height)
  glMatrixMode(GL_PROJECTION)
  glLoadIdentity
  gluPerspective(80, (1.0 * width) / height, 1, 1000.0)
  glMatrixMode(GL_MODELVIEW)
  glLoadIdentity()    
  gluLookAt(0.0, 80.0, 500.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)
  #gluLookAt(0.0, 60.0, 500.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)
end

def idle
  @spin = @spin + 1

  if @spin > 360.0
    @spin = @spin - 360.0
  end

  @frame_time = glutGet(GLUT_ELAPSED_TIME) - @frame_start
  
  if (@frame_time< DELAY_TIME)
    sleep((DELAY_TIME - @frame_time) / 1000.0)
  end
  glutPostRedisplay
end

def check_fps
  current_time = glutGet(GLUT_ELAPSED_TIME)
  delta_time = current_time - @previous_time

  @frame_count += 1

  if (delta_time > 1000)
    fps = @frame_count / (delta_time / 1000.0)
    puts "FPS: #{fps}"
    @frame_count = 0
    @previous_time = current_time
  end
end

@spin = 0.0
@previous_time = 0
@frame_count = 0

load_objects
glutInit
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH)
glutInitWindowSize(1200,800)
glutInitWindowPosition(10,10)
glutCreateWindow("Animation project")
glutDisplayFunc :draw
glutReshapeFunc :reshape
glutIdleFunc :idle
initGL
glutMainLoop
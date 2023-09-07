--goals of things to add
--fractions and decimal support
--also, if time, something that allows you to use an output as an input for the next thing

function love.load()
    font = love.graphics.newFont("Simply Rounded Bold.ttf",24,normal,1)
    font30 = love.graphics.newFont("Simply Rounded Bold.ttf",30,normal,1)
    mode = "start"
    mat1rows=1
    mat1columns=1
    mat2rows=1
    mat2columns=1
    rowssel=true
    columnssel=false
    undefined=false
    sel={1,1}
    mat1={}
    mat2={}
    mat3={}
	inputnum={}
	digit=1
	finalinput=0
	printfinalinput=0
    scalar=0
    mat3rows=1
    mat3columns=1
end

function love.draw()
    love.graphics.clear(0.282,0.749,0.572)
    if mode=="start" then
        love.graphics.print("Matrices Calculator",font30,250,150)
        love.graphics.print("Press enter to start!",font,270,200)
    elseif mode=="mat1sel1" then
        if rowssel==true then
            love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
            love.graphics.rectangle("fill", 248,218, 170,26)
        end
        if columnssel==true then
            love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
            love.graphics.rectangle("fill", 248,248, 170,26)
        end
        love.graphics.setColor( 255, 255, 255, 1 )
        love.graphics.print(mat1rows,font,400,220)
        love.graphics.print(mat1columns,font,400,250)
        love.graphics.print("Press up and down to change selection",font,200,10)
        love.graphics.print("Press left and right to change values",font,200,40)
        love.graphics.print("Rows:",font,250,220)
        love.graphics.print("Columns:",font,250,250)
        love.graphics.print("Matrix A",font30,250,170)
    elseif mode=="mat2sel1" then
        if rowssel==true then
            love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
            love.graphics.rectangle("fill", 248,218, 170,26)
        end
        if columnssel==true then
            love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
            love.graphics.rectangle("fill", 248,248, 170,26)
        end
        love.graphics.setColor( 255, 255, 255, 1 )
        love.graphics.print("Press up and down to change selection",font,200,10)
        love.graphics.print("Press left and right to change values",font,200,40)
        love.graphics.print(mat2rows,font,400,220)
        love.graphics.print(mat2columns,font,400,250)
        love.graphics.print("Rows:",font,250,220)
        love.graphics.print("Columns:",font,250,250)
        love.graphics.print("Matrix B",font30,250,170)
    elseif mode=="interim" and undefined then
        love.graphics.print("Undefined",font30,330,200)
        love.graphics.print("Press enter to continue",font,270,235)
    elseif mode=="mat1sel2" then
		love.graphics.print(sel[2],font,10,80)
		love.graphics.print(sel[1],font,10,40)
		love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
		love.graphics.rectangle("fill",20+sel[2]*90,13+30*sel[1],80,25)
		love.graphics.setColor(1,1,1,1)
        for r=1,mat1rows do
            for c=1,mat1columns do
                love.graphics.print(mat1[r][c],font30,20+90*c,10+30*r)
                
            end
        end
        love.graphics.rectangle("fill",93,38,15,3)
        love.graphics.rectangle("fill",93,38,3,3+30*mat1rows)
        love.graphics.rectangle("fill",93,39+30*mat1rows,15,3)
		love.graphics.rectangle("fill",88+90*mat1columns,38,15,3)
        love.graphics.rectangle("fill",102+90*mat1columns,38,3,3+30*mat1rows)
        love.graphics.rectangle("fill",88+90*mat1columns,39+30*mat1rows,17,3)
        love.graphics.print("Press enter to edit values, space to continue",font,200,5)
        love.graphics.print("Matrix A",font30,5,5)
	elseif mode=="inputnum" then
		love.graphics.print(finalinput,font30,300,300)
        if negative then
            love.graphics.print("-",font30,280,300)
        end
        love.graphics.print("Enter a value using number keys and then press enter when done",font,10,10)
    elseif mode=="mat2sel2" then
		love.graphics.print(sel[2],font,10,80)
		love.graphics.print(sel[1],font,10,40)
		love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
		love.graphics.rectangle("fill",20+sel[2]*90,13+30*sel[1],80,25)
		love.graphics.setColor(1,1,1,1)
        for r=1,mat2rows do
            for c=1,mat2columns do
                love.graphics.print(mat2[r][c],font30,20+90*c,10+30*r)
                
            end
        end
        love.graphics.rectangle("fill",93,38,15,3)
        love.graphics.rectangle("fill",93,38,3,3+30*mat2rows)
        love.graphics.rectangle("fill",93,39+30*mat2rows,15,3)
		love.graphics.rectangle("fill",88+90*mat2columns,38,15,3)
        love.graphics.rectangle("fill",102+90*mat2columns,38,3,3+30*mat2rows)
        love.graphics.rectangle("fill",88+90*mat2columns,39+30*mat2rows,17,3)
        love.graphics.print("Same controls as Mat A",font,200,5)
        love.graphics.print("Matrix B",font30,5,5)
    elseif mode=="modeselect" then
        love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
        love.graphics.rectangle("fill", 198,168+sel[1]*30, 245,28)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print("Matrix Addition",font,200,200)
        love.graphics.print("Matrix Subtraction",font,200,230)
        love.graphics.print("Matrix Multiplication",font,200,260)
        love.graphics.print("Scalar Multiplication",font,200,290)
    elseif mode=="undefined" then
        love.graphics.print("Undefined",font30,300,200)
        love.graphics.print("Press enter or escape to go back",font,180,235)
    elseif mode=="displaycalc" then
        for r=1,mat3rows do
            for c=1,mat3columns do
                love.graphics.print(mat3[r][c],font30,20+90*c,10+30*r)
                
            end
        end
        love.graphics.rectangle("fill",93,38,15,3)
        love.graphics.rectangle("fill",93,38,3,3+30*mat3rows)
        love.graphics.rectangle("fill",93,39+30*mat3rows,15,3)
		love.graphics.rectangle("fill",88+90*mat3columns,38,15,3)
        love.graphics.rectangle("fill",102+90*mat3columns,38,3,3+30*mat3rows)
        love.graphics.rectangle("fill",88+90*mat3columns,39+30*mat3rows,17,3)
        love.graphics.print("Press enter to return to start",font,200,5)
    elseif mode=="matsel" then
        love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
        love.graphics.rectangle("fill", 198,168+sel[1]*30, 100,28)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print("Matrix A",font,200,200)
        love.graphics.print("Matrix B",font,200,230)
    elseif mode=="multmodesel" then
        love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
        love.graphics.rectangle("fill", 198,168+sel[1]*30, 220,28)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print("Matrix A*Matrix B",font,200,200)
        love.graphics.print("Matrix B*Matrix A",font,200,230)
    elseif mode=="submodesel" then
        love.graphics.setColor( 0, 0.5294, 0.7411, 1 )
        love.graphics.rectangle("fill", 198,168+sel[1]*30, 220,28)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print("Matrix A-Matrix B",font,200,200)
        love.graphics.print("Matrix B-Matrix A",font,200,230)
    end
end

function love.update(dt)
    if mode=="start" then
        update_start()
    elseif mode=="mat1sel1" then
        update_mat1sel1()
    elseif mode=="mat2sel1" then
        update_mat2sel1()
    elseif mode=="interim" then
        update_interim()
    elseif mode=="mat1sel2" then
        update_mat1sel2()
	elseif mode=="inputnum" then
		update_inputnum()
    elseif mode=="mat2sel2" then
        update_mat2sel2()
    elseif mode=="modeselect" then
        update_modeselect()
    elseif mode=="undefined" then
        update_undefined()
    elseif mode=="displaycalc" then
        update_displaycalc()
    elseif mode=="matsel" then
        update_matsel()
    elseif mode=="multmodesel" then
        update_multmodesel()
    elseif mode=="submodesel" then
        update_submodesel()
    end
    backspacedown,perioddown,slashdown,downdown,rightdown,leftdown,updown,enterdown,zerodown,onedown,twodown,threedown,fourdown,fivedown,sixdown,sevendown,eightdown,ninedown,escdown,minusdown,spacedown=false
end
function love.keypressed(key,scancode,isrepeat)
    if key=="down" then
        downdown=true
    elseif key=="right" then
        rightdown=true
    elseif key=="up" then
        updown=true
    elseif key=="left" then
        leftdown=true
    elseif key=="return" then
        enterdown=true
	elseif key=="0" then
		zerodown=true
	elseif key=="1" then
		onedown=true
	elseif key=="2" then
		twodown=true
	elseif key=="3" then
		threedown=true
	elseif key=="4" then
		fourdown=true
	elseif key=="5" then
		fivedown=true
	elseif key=="6" then
		sixdown=true
	elseif key=="7" then
		sevendown=true
	elseif key=="8" then
		eightdown=true
	elseif key=="9" then
		ninedown=true
    elseif key=="escape" then
        escdown=true
    elseif key=="-" then
        minusdown=true
    elseif key=="space" then
        spacedown=true
    elseif key=="/" then
        slashdown=true
    elseif key=="." then
        perioddown=true
    elseif key=="backspace" then
        backspacedown=true
    end
end
function update_start()
    if love.keyboard.isDown("return") then
        mode="mat1sel1"
    end
end

function update_mat1sel1()
    if rowssel==true then
        if rightdown then
            mat1rows=mat1rows+1
        elseif leftdown then
            if mat1rows>1 then
                mat1rows=mat1rows-1
            end
        elseif downdown then
            rowssel=false
            columnssel=true
        end
    elseif columnssel==true then
        if updown then
            rowssel=true
            columnssel=false
        elseif leftdown then
            if mat1columns>1 then
                mat1columns=mat1columns-1
            end
        elseif rightdown then
            mat1columns=mat1columns+1
        end
    end
    for i = 0,mat1rows do
        mat1[i] = {}
        for j = 0,mat1columns do
            mat1[i][j] = 0
        end
    end
    if (mat1rows>0 or mat1columns>0) and enterdown then
        mode="mat2sel1"
    end
end

function update_mat2sel1()
    if rowssel==true then
        if rightdown then
            mat2rows=mat2rows+1
        elseif leftdown then
            if mat2rows>1 then
                mat2rows=mat2rows-1
            end
        elseif downdown then
            rowssel=false
            columnssel=true
        end
    elseif columnssel==true then
        if updown then
            rowssel=true
            columnssel=false
        elseif leftdown then
            if mat2columns>1 then
                mat2columns=mat2columns-1
            end
        elseif rightdown then
            mat2columns=mat2columns+1
        end
    end
    if (mat2rows>0 or mat2columns>0) and enterdown then
        for i = 1,mat2rows do
            mat2[i] = {}
            for j = 1,mat2columns do
                mat2[i][j] = 0
            end
        end
        mode="interim"
    end
    if escdown then
        mode="mat1sel1"
    end
end

function update_interim()
    mode="mat1sel2"
end

function update_mat1sel2()
	if rightdown then
		sel[2]=sel[2]+1
		if sel[2]>mat1columns then
			sel[2]=1
			sel[1]=sel[1]+1
			if sel[1]>mat1rows then
				sel[1]=1
			end
		end
	elseif leftdown then
		sel[2]=sel[2]-1
			if sel[2]<1 then
				sel[1]=sel[1]-1
				sel[2]=mat1columns
				if sel[1]<1 then
					sel[1]=mat1rows
				end
			end
	elseif updown then
		sel[1]=sel[1]-1
		if sel[1]<1 then
			sel[1]=mat1rows
		end
	elseif downdown then
		sel[1]=sel[1]+1
		if sel[1]>mat1rows then
			sel[1]=1
		end
	elseif enterdown then
		returnmode="mat1sel2"
		mode="inputnum"
        negative=false
	end
    if escdown then
        mode="mat2sel1"
    end
    if spacedown then
        mode="mat2sel2"
        sel={1,1}
    end
end

function update_mat2sel2()
	if rightdown then
		sel[2]=sel[2]+1
		if sel[2]>mat2columns then
			sel[2]=1
			sel[1]=sel[1]+1
			if sel[1]>mat2rows then
				sel[1]=1
			end
		end
	elseif leftdown then
		sel[2]=sel[2]-1
			if sel[2]<1 then
				sel[1]=sel[1]-1
				sel[2]=mat2columns
				if sel[1]<1 then
					sel[1]=mat2rows
				end
			end
	elseif updown then
		sel[1]=sel[1]-1
		if sel[1]<1 then
			sel[1]=mat2rows
		end
	elseif downdown then
		sel[1]=sel[1]+1
		if sel[1]>mat2rows then
			sel[1]=1
		end
	elseif enterdown then
		returnmode="mat2sel2"
		mode="inputnum"
        negative=false
	end
    if escdown then
        mode="mat1sel2"
    end
    if spacedown then
        mode="modeselect"
        sel={1,1}
    end
end

function update_inputnum()
	if zerodown then
		inputnum[digit]=0
		digit=digit+1
        repeatedcode()
	elseif onedown then
		inputnum[digit]=1
		digit=digit+1
        repeatedcode()
	elseif twodown then
		inputnum[digit]=2
		digit=digit+1
        repeatedcode()
	elseif threedown then
		inputnum[digit]=3
		digit=digit+1
        repeatedcode()
	elseif fourdown then
		inputnum[digit]=4
		digit=digit+1
        repeatedcode()
	elseif fivedown then
		inputnum[digit]=5
		digit=digit+1
        repeatedcode()
	elseif sixdown then
		inputnum[digit]=6
		digit=digit+1
        repeatedcode()
	elseif sevendown then
		inputnum[digit]=7
		digit=digit+1
        repeatedcode()
	elseif eightdown then
		inputnum[digit]=8
		digit=digit+1
        repeatedcode()
	elseif ninedown then
		inputnum[digit]=9
		digit=digit+1
        repeatedcode()
    elseif backspacedown then
        inputnum[#inputnum]=nil
        if digit>1 then
            digit=digit-1
        end
        repeatedcode()
	end
    if minusdown then
        if negative then 
            negative=false
        else
            negative=true
        end
    end
	if enterdown then
        if returnmode=="mat1sel2" then
            if negative then
                mat1[sel[1]][sel[2]]=-finalinput
            else
                mat1[sel[1]][sel[2]]=finalinput
            end
        elseif returnmode=="mat2sel2" then
            if negative then
                mat2[sel[1]][sel[2]]=-finalinput
            else
                mat2[sel[1]][sel[2]]=finalinput
            end
        else
            if negative then
                scalar=-finalinput
            else
                scalar=finalinput
            end
        end
		digit=1
		inputnum={}
		finalinput=0
		mode=returnmode
		returnmode=nil
	end
end

function repeatedcode()
    finalinput=0
    for i=1,#inputnum do 
        finalinput=finalinput+(inputnum[i])*((10^#inputnum)/(10^i))
    end
end

function update_modeselect()
    if downdown then
        sel[1]=sel[1]+1
        if sel[1]>4 then
            sel[1]=1
        end
    elseif updown then
        sel[1]=sel[1]-1
        if sel[1]<1 then
            sel[1]=4
        end
    end
    if enterdown then

        if sel[1]==1 then
            for i = 0,mat1rows do
                mat3[i] = {}
                for j = 0,mat1columns do
                    mat3[i][j] = 0
                end
            end
            if mat1rows==mat2rows and mat1columns==mat2columns then
                mode="displaycalc"
                matrixsubtraction(mat2rows,mat2columns,mat1columns,mat1rows,mat2,mat1,false)
            else
                mode="undefined"
            end
            mat3rows=mat1rows
            mat3columns=mat1columns
        elseif sel[1]==2 then
            for i = 0,mat1rows do
                mat3[i] = {}
                for j = 0,mat1columns do
                    mat3[i][j] = 0
                end
            end
            if mat1rows==mat2rows and mat1columns==mat2columns then
                mode="submodesel"
            else
                mode="undefined"
            end
            mat3rows=mat1rows
            mat3columns=mat1columns
        elseif sel[1]==3 then
            mode="multmodesel"
        elseif sel[1]==4 then
            for i = 0,mat1rows do
                mat3[i] = {}
                for j = 0,mat1columns do
                    mat3[i][j] = 0
                end
            end
            mode="inputnum"
            returnmode="matsel"
        end
    end
    if escdown then
        mode="mat2sel2"
    end
end

function update_undefined()
    if escdown or enterdown then
        mode="modeselect"
    end
end

function update_displaycalc()
    if enterdown then
        love.load()
    end
end

function update_matsel()
    if downdown then
        sel[1]=sel[1]+1
    elseif updown then
        sel[1]=sel[1]-1
    end
    if sel[1]<1 then
        sel[1]=2
    end
    if sel[1]>2 then
        sel[1]=1
    end
    if enterdown then
        mode="displaycalc"
        if sel[1]==1 then
            scalarmultiplication(mat1,mat1rows,mat1columns)
        elseif sel[1]==2 then
            scalarmultiplication(mat2,mat2rows,mat2columns)
        end
    end
end

function update_submodesel()
    update_basesel()
    for i = 0,mat1rows do
        mat3[i] = {}
        for j = 0,mat1columns do
            mat3[i][j] = 0
        end
    end
    if enterdown then
        mode="displaycalc"
        if sel[1]==1 then
            matrixsubtraction(mat1rows,mat1columns,mat2columns,mat2rows,mat1,mat2,true)
        else
            matrixsubtraction(mat2rows,mat2columns,mat1columns,mat1rows,mat2,mat1,true)
        end
    end
end

function update_multmodesel()
    update_basesel()
    if enterdown then
        mode="displaycalc"
        if sel[1]==1 then
            matrixmultiplication(mat1rows,mat1columns,mat2rows,mat2columns,mat1,mat2)
        else
            matrixmultiplication(mat2rows,mat2columns,mat1rows,mat1columns,mat2,mat1)
        end
    end
end

function scalarmultiplication(matnum,matrows,matcolumns)
    for r=1,matrows do
        for c=1,matcolumns do
            mat3[r][c]=matnum[r][c]*scalar
        end
    end
    mat3rows=matrows
    mat3columns=matcolumns
end

function matrixsubtraction(matrows,matcolumns,matcolumns2,matrows2,matsub1,matsub2,subyes)
    if mat1rows==mat2rows and mat1columns==mat2columns then
        for r1=1,matrows do
            for c1=1,matcolumns do
                for r2=1,matcolumns2 do
                    for c2=1,matrows2 do
                        if r1==r2 and c1==c2 then
                            if subyess then
                                mat3[r1][c1]=matsub1[r1][c1]-matsub2[r1][c2]
                            else
                                mat3[r1][c1]=matsub1[r1][c1]+matsub2[r1][c2]
                            end
                        end
                    end
                end
            end
        end
    else
        mode="undefined"
    end
    mat3rows=mat1rows
    mat3columns=mat1columns
end

function matrixmultiplication(matrows,matcolumns,matrows2,matcolumns2,matmult1,matmult2)
    for i=1,matrows do
        mat3[i] = {}
        for j=1,matcolumns2 do
            mat3[i][j]=0
        end
    end
    if matcolumns==matrows2 then
        for r1=1,matrows do
            
            for c2=1,matcolumns2 do
                for r2=1,matrows2 do
                    mat3[r1][c2]=mat3[r1][c2]+matmult1[r1][r2]*matmult2[r2][c2]

                end
            end
        end
    else
        mode="undefined"
    end
    mat3rows=matrows
    mat3columns=matcolumns2
end

function update_basesel()
    if downdown then
        sel[1]=sel[1]+1
    elseif updown then
        sel[1]=sel[1]-1
    end
    if sel[1]<1 then
        sel[1]=2
    end
    if sel[1]>2 then
        sel[1]=1
    end
end
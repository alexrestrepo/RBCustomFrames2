#tag ClassProtected Class FrameObjectInherits RectObject	#tag Event		Sub Paint(g as graphics)		  //frame objects can have "inputs" and "outputs", if these are present, draw a small "connection" icon		  if  Inputs > 0 then		    g.ForeColor = &cFFF965		    g.fillOval inLinkX, inLinkY - 2, 7, 7		    g.ForeColor = &c888888		    g.DrawOval inLinkX, inLinkY - 2, 7, 7		  end if		  		  if outputs > 0 then		    g.ForeColor = &cFFF965		    g.fillOval outLinkX, outLinkY - 2, 7, 7		    g.ForeColor = &c888888		    g.DrawOval outLinkX,outLinkY - 2, 7, 7		  end if		  		  //and forward the paint event...		  Paint(g)		  		  'g.DrawRect x,y,Width,Height		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub doHighlight(g as graphics, basex as integer, basey as integer)		  Highlight g, basex, basey		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function doMouseDown(mx as integer, my as integer, parentCanvas as frameCanvas, parentFrame as contentFrame) As boolean		  Return MouseDown(mx,my, parentCanvas, parentFrame)		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub incrementInputs()		  //add an input to this object		  inputs = Inputs + 1		  		  if inputs = 1 then //modify size only once		    X = X +10		    Width = Width - 10		  end if		  		  LinkPerformed		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub incrementOutputs()		  //add an output		  outputs = outputs + 1		  		  if outputs = 1 then //modify size only once		    Width = Width - 10		  end if		  		  LinkPerformed		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub initWithSize(x as integer, y as integer, width as integer)		  self.x = x		  self.y = y		  self.Width = width		  init		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function inLinkX() As integer		  //location of the link point		  if inputs > 0 then Return X - 10		  Return X		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function inLinkY() As integer		  //location of the link point		  Return Y + Height / 2		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function outLinkX() As integer		  //location of the link point		  if outputs > 0 then Return X + Width + 3		  Return X + Width		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function outLinkY() As integer		  //location of the link point		  Return inLinkY		End Function	#tag EndMethod	#tag Hook, Flags = &h0		Event Highlight(g as graphics, basex as integer, basey as integer)	#tag EndHook	#tag Hook, Flags = &h0		Event init()	#tag EndHook	#tag Hook, Flags = &h0		Event LinkPerformed()	#tag EndHook	#tag Hook, Flags = &h0		Event MouseDown(mx as integer, my as integer, parentCanvas as frameCanvas, parentFrame as contentFrame) As boolean	#tag EndHook	#tag Hook, Flags = &h0		Event Paint(g as graphics)	#tag EndHook	#tag Note, Name = About		FrameObject		By Alex Restrepo		send comments, suggestions, fixes to alexrestrepo@mac.com				This is the base object for all objects contained in a frame.		When subclassing, make sure to set the acceptsConnections property to true if you want that object to accept/create links				Open source under the Creative Commons Attribution License: If you decide to use it in your projects, please give me credit in your about window or documentation.		Use in whatever way you like... at your own risk :P		let me know if you find it useful.					#tag EndNote	#tag Property, Flags = &h0		acceptsConnections As boolean	#tag EndProperty	#tag Property, Flags = &h0		handlesMouseEvents As boolean	#tag EndProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return mID			End Get		#tag EndGetter		#tag Setter			Set			  mID = value			End Set		#tag EndSetter		ID As variant	#tag EndComputedProperty	#tag Property, Flags = &h1		Protected inputs As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private mID As variant	#tag EndProperty	#tag Property, Flags = &h21		Private mtag As variant	#tag EndProperty	#tag Property, Flags = &h1		Protected outputs As Integer	#tag EndProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			  return mtag			End Get		#tag EndGetter		#tag Setter			Set			  mtag = value			End Set		#tag EndSetter		Tag As variant	#tag EndComputedProperty	#tag ViewBehavior		#tag ViewProperty			Name="acceptsConnections"			Group="Behavior"			InitialValue="0"			Type="boolean"		#tag EndViewProperty		#tag ViewProperty			Name="handlesMouseEvents"			Group="Behavior"			InitialValue="0"			Type="boolean"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="RectObject"		#tag EndViewProperty		#tag ViewProperty			Name="X"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="RectObject"		#tag EndViewProperty		#tag ViewProperty			Name="Y"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="RectObject"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass
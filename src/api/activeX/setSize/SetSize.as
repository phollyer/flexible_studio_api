package api.activeX.setSize
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setSize.SetSizeEvent.RESULT_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Set the <code>height</code> and <code>width</code> of the ActiveX Object.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setSize.html Northcode Help Documentation
	 */
	public class SetSize extends ActiveX
	{
		/**
		 * The Height of the ActiveX Object
		 * 
		 * @defaultValue 200
		 */
		public var height:Number = 200;
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The Width of the ActiveXObject
		 * 
		 * @defaultValue 200
		 */
		public var width:Number = 200;
		
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Set the <code>height</code> and <code>width</code> of the ActiveX Object.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setSize.html Northcode Help Documentation
		 */
		public function setSize( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActriveX.setSize( {object:object , height:height , width:width}
											,{callback:actionComplete, errorSTR:"setSizeError", code:"15013"} );
			}
		}
	}
}
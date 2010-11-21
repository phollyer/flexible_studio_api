package api.activeX.setSize
{
	import api.activeX.ActiveX;

	import api.events.activeX.setSize.SetSizeEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>object</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	*/
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setSize.html Northcode Help Documentation
	*/
	public class SetSize extends ActiveX
	{
		/**
		* 
		*
		* @defaultValue <code>200</code>
		*/
		public var height:Number = 200;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var object:String = null;
		
		/**
		* 
		*
		* @defaultValue <code>200</code>
		*/
		public var width:Number = 200;
		
		/**
		* Constructor for ActiveX.SetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setSize.html Northcode Help Documentation
		*/
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param activeXObject
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
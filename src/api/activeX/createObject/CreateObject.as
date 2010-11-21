package api.activeX.createObject
{
	import api.activeX.ActiveX;

	import api.events.activeX.createObject.CreateObjectEvent;

	import api.vos.activeX.CreateObjectVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>object</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	*/
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied. 
	 * 
	 * @eventType api.events.activeX.createObject.CreateObjectEvent.RESULT_PROG_ID
	 */
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
	*/
	public class CreateObject extends ActiveX
	{		
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var object:String = null;
		
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var progID:String = null;
		
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var objectProperties:CreateObjectVO = new CreateObjectVO();
		
		/**
		* Constructor for ActiveX.CreateObject()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
		*/
		public function CreateObject(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param activeXObject
		*
		* @param progIDString
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_createObject.html Northcode Help Documentation
		*/
		public function createObject( activeXObject:String = null , progIDString:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			progID = compareStrings( progIDString , progID );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					switch( progID )
					{
						case null:
							missingProgID();
							break;
						default:
							ssCore.ActiveX.createObject( createAXObject()
													    ,{callback:actionComplete, errorSTR:"createObjectError", code:"15004"} );
					}
			}
		}
		
		/**
		 * Create on object with the properties required  to fulfill the command.
		 * 
		 * @ private
		 */
		private function createAXObject():Object
		{
			var __o : Object = new Object();
			__o = objectProperties;
			__o.object = object;
			__o.progID = progID;
			
			return __o;
		}

	}
}
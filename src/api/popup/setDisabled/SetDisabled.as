package api.popup.setDisabled
{
	import api.events.popup.setDisabled.SetDisabledEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>flag</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FLAG
	*/
	[Event(name="missingFlag" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Enable, disable or toggle the 'disabled' state of a menu item.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setDisabled.html Northcode Help Documentation
	*/
	public class SetDisabled extends Popup
	{
		public static const CHECKED:String = "true";
		public static const UNCHECKED:String = "false";
		public static const TOGGLE:String = "toggle";
		
		// Required
		/**
		* The name of the menu that contains the item.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* The ID of the menu item to be modified.
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		/**
		* Indicates the new 'disabled' state of the menu item. Valid values include: true, false, and toggle.
		*
		* @defaultValue <code>null</code>
		*/
		public var flag:String = null;
		
		/**
		* Constructor for Popup.SetDisabled()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setDisabled.html Northcode Help Documentation
		*/
		public function SetDisabled(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Enable, disable or toggle the 'disabled' state of a menu item.
		*
		*
		* @param menuName
		*
		* @param itemID
		*
		* @param checkedFlag
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setDisabled.html Northcode Help Documentation
		*/
		public function setDisabled( menuName:String = null , itemID:String = null , checkedFlag:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			flag = compareStrings( checkedFlag , flag );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( id )
					{
						case null:
							missingID();
							break;
						default:
							switch( flag )
							{
								case null:
									missingFlag();
									break;
								case CHECKED:
								case TOGGLE:
								case UNCHECKED:
									ssCore.Popup.setDisabled( {name:name , id:id , flag:flag}
														     ,{callback:actionComplete, errorSTR:"setDisabledError", code:"31007"} );
									break;
								default:
									invalidFlag();
							}
					}
			}
		}
		private function invalidFlag():void
		{
			var e : SetDisabledEvent = new SetDisabledEvent( SetDisabledEvent.INVALID_FLAG );
			dispatchEvent( e );
		}


	}
}
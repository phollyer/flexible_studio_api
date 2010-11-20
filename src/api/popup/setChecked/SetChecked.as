package api.popup.setChecked
{
	import api.events.popup.setChecked.SetCheckedEvent;

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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setChecked.html Northcode Help Documentation
	*/
	public class SetChecked extends Popup
	{
		public static const CHECKED:String = "true";
		public static const UNCHECKED:String = "false";
		public static const TOGGLE:String = "toggle";
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var flag:String = null;
		
		/**
		* Constructor for Popup.SetChecked()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setChecked.html Northcode Help Documentation
		*/
		public function SetChecked(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param menuName
		*
		* @param itemID
		*
		* @param checkedFlag
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setChecked.html Northcode Help Documentation
		*/
		public function setChecked( menuName:String = null , itemID:String = null , checkedFlag:String = null ):void
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
									ssCore.Popup.setChecked( {name:name , id:id , flag:flag}
														    ,{callback:actionComplete, errorSTR:"setCheckedError", code:"31006"} );
									break;
								default:
									invalidFlag();
							}
					}
			}
		}
		private function invalidFlag():void
		{
			var e : SetCheckedEvent = new SetCheckedEvent( SetCheckedEvent.RESULT_FLAG );
			dispatchEvent( e );
		}


	}
}
package api.popup.setText
{
	import api.events.popup.setText.SetTextEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Change the text of a menu item
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setText.html Northcode Help Documentation
	*/
	public class SetText extends Popup
	{
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Popup.SetText()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setText.html Northcode Help Documentation
		*/
		public function SetText(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Change the text of a menu item
		*
		*
		* @param menuName
		*
		* @param itemID
		*
		* @param textSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setText.html Northcode Help Documentation
		*/
		public function setText( menuName:String = null , itemID:String = null , textSTR:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			text = compareStrings( textSTR , text );
			
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
							switch( text )
							{
								case null:
									missingText();
									break;
								default:
									ssCore.Popup.setText( {name:name , id:id , text:text}
														 ,{callback:actionComplete, errorSTR:"setTextError", code:"31009"} );
							}
					}
			}
		}


	}
}
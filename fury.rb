#!/usr/bin/ruby

if ARGV[0] == "package" || ARGV[0] == "p"
	@packname = ARGV[1]
	@name = ARGV[2] unless @packname.nil?
	
	unless @packname.nil?
		unless @name.nil?
			# Specify filenames
			filename = "#{@name}.hx"
			specname = "#{@name}Spec.hx"
			dataname = "#{@name}Data.hx"
			# Specify filedata
			file_data = "package #{@packname};
			import #{@packname}spec.#{@name}Spec;
			class #{@name} {  
			} // #{@name}"
			spec_data = "package #{@packname}Spec;
			import #{@packname}.#{@name};
			import #{@packname}.#{@name}Data;
			import haxespec.FuryTestCase;
			class #{@name}Spec extends FuryTestCase { 
				private var subject : #{@name};
				public override fuction setup() { 
				
				} // setup
				public function testSomething() { 
					trace( 'Either write something here or delete me!' );
					this.assertTrue( false );
				} // testSomething
				public override function tearDown() { 
				
				} // tearDown
			} // #{@name}Spec"
			data_data = "package #{@packname}Data;
			typedef #{@packname}Data = { 
			
			}; // #{@packname}Data "
			# Check & Make filedirectory
			Dir.mkdir( "./src/#{@packname}") if Dir["./src/#{@packname}"].nil? 
			puts "Created : directory ./src/#{@packname}"
			
			Dir.mkdir( "./src/#{@packname}Spec") if Dir["./src/#{@packname}Spec"].nil? 
			puts "Created : directory ./src/#{@packname}Spec"
			
			Dir.mkdir( "./src/#{@packname}Data") if Dir["./src/#{@packname}Data"].nil? 
			puts "Created : directory ./src/#{@packname}Data"
			
			# Writing files
			File.open( "./src/#{@packname}/#{@filename}", "w") do |file|
				file.puts file_data
			end # File.open
			puts "Created : ./src/#{@packname}/#{@filename}"
			
			File.open( "./src/#{@packname}Spec/#{@specname}", "w") do |file|
				file.puts spec_data
			end # File.open
			puts "Created : ./src/#{@packname}Spec/#{@specname}"
			
			File.open( "./src/#{@packname}Data/#{@dataname}", "w") do |file|
				file.puts data_data
			end # File.open
			puts "Created : ./src/#{@packname}Data/#{@dataname}"
		end # unless name.nil
	end # unless packname.nil
end # if

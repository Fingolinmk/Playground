import React, { useEffect, useState } from 'react';
import "antd/dist/antd.css";
import { Layout, Typography, Carousel, Tabs, Collapse, Table, Anchor } from 'antd';

import { Canvas, useLoader, useThree } from '@react-three/fiber'
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader'
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

import "./index.css";
import Highlight, { defaultProps } from 'prism-react-renderer';

const { Link } = Anchor;
const { TabPane } = Tabs;
const { Header, Footer, Sider, Content } = Layout;
const { Title, Paragraph } = Typography;
const { Panel } = Collapse;

const CameraController = () => {
  const { camera, gl } = useThree();
  useEffect(
    () => {
      const controls = new OrbitControls(camera, gl.domElement);

      controls.minDistance = 3;
      controls.maxDistance = 20;
      return () => {
        controls.dispose();
      };
    },
    [camera, gl]
  );
  return null;
};

function STL(props: any) {

  const [geometry, setGeometry] = useState(useLoader(STLLoader, process.env.PUBLIC_URL + "/Lampenschirm.stl"))
  const [hovered, setHover] = useState(false)
  const [active, setActive] = useState(false)


  return (
    <div>

      <div style={{
        width: "250", height: "800px",

      }}>

        <Canvas><CameraController />
          <ambientLight />
          <pointLight position={[0, 0, 0]} color='Red' />
          <pointLight position={[10, 0, 0]} color='White' />
          <pointLight position={[10, 10, 0]} color='White' />
          <mesh
            {...props}
            scale={0.05}
            onClick={(event) => setActive(!active)}
            onPointerOver={(event) => setHover(true)}
            onPointerOut={(event) => setHover(false)
            }
          >

            <primitive object={geometry} attach="geometry" />
            <meshStandardMaterial color={hovered ? '#4d4d4d' : "#4d4d4d"} />
          </mesh>
        </Canvas>
      </div>
    </div >
  )

}


function App() {
  const [main, setMain] = useState("Loading..");
  const [helper, setHelper] = useState("Loading..");
  const [rgb_lighthelper, setRgb_lighthelper] = useState("Loading..");
  const [colormatrix_helper, setColormatrix_helper] = useState("Loading..");
  const [collapsed, setCollapsed] = useState(false);
  useEffect(() => {

    const fetchData = async () => {
      const main_code = await loadData("https://raw.githubusercontent.com/Fingolinmk/Playground/main/firmware/Light/src/main.cpp")
      setMain(main_code);
      const heper_code = await loadData("https://raw.githubusercontent.com/Fingolinmk/Playground/main/firmware/Light/lib/helper/src/helper.hpp")
      setHelper(heper_code);
      const lighthelper_code = await loadData("https://raw.githubusercontent.com/Fingolinmk/Playground/main/firmware/Light/lib/helper/src/colormatrix_helper.hpp")
      setRgb_lighthelper(lighthelper_code);

      const colMatrixhelpr = await loadData("https://raw.githubusercontent.com/Fingolinmk/Playground/main/firmware/Light/lib/helper/src/colormatrix_helper.hpp")
      setColormatrix_helper(colMatrixhelpr);
    }
    fetchData();
  });
  const loadData = async (url: string): Promise<string> => {
    const response = await fetch(url);

    if (response.ok) {
      return response.text();
    }
    return ('Error loading.');
  }

  const [width, setWidth] = React.useState(window.innerWidth);
  const breakpoint = 620;

  useEffect(() => {
    window.addEventListener("resize", () => {
      setWidth(window.innerWidth);
    })


  }, []);
  const contentStyle: React.CSSProperties = {
    height: '500px',
    color: '#fff',
    lineHeight: '160px',
    textAlign: 'center',
    background: '#364d79',
    alignContent: 'center',
  };
  const contentStylePortait: React.CSSProperties = {
    height: '700px',
    color: '#fff',
    lineHeight: '160px',
    textAlign: 'center',
    background: '#364d79',
    alignContent: 'center',
  };

  const showSider = (): any => {
    return width < breakpoint ? <p /> : <Sider collapsible collapsed={collapsed} onCollapse={value => setCollapsed(value)} width={200} className="site-layout-background" theme='light'>

      <Anchor>
        <Link href="#Introduction" title="Introduction" />
        <Link href="#Hardware" title="Hardware" >
          <Link href="#Electronics" title="Electronics" />
          <Link href="#Housing" title="Housing" />
        </Link>
        <Link href="#Firmware" title="Firmware" />
        <Link href="#Software" title="Software" />
      </Anchor>
    </Sider>;
  }


  const dataSource = [
    {
      key: '1',
      topic: 'light',
      command: 'rgb(R:INT, G:INT, B:INT)',
      example: 'light - "rgb(255,0,0)", sets the lamp to red',
      description: 'The colors are R(ed),G(reen), and B(lue). The colors can be 0-255',
    },
    {
      key: '2',
      topic: 'light',
      command: 'random',
      example: 'light : random',
      description: 'sets a random color pattern for the lamp',
    },
    {
      key: '3',
      topic: 'light',
      command: 'Sparkle',
      example: 'light : Sparkle',
      description: 'Lets the lamp sparkel in a random pattern for the time provided by the timer',
    },
    {
      key: '4',
      topic: 'light/timer',
      command: 'time_in_mins:INT',
      example: 'light/timer: 10',
      description: 'Sets the timer for fadeout and for sparkel to 10 minutes',
    },

    {
      key: '5',
      topic: 'light/Alert/Status',
      command: 'time_in_mins:BOOL',
      example: 'light/timer: true enables the alert, that has been specified by light/Alert/Time',
      description: 'Sets the timer for fadeout and for sparkel to 10 minutes',
    },
    {
      key: '6',
      topic: 'light/Alert/Time',
      command: '"{"hour":[INT],"minute":[INT]}":INT',
      example: 'light/Alert/Time : "{"hour":2,"minute":3}"',
      description: ' Sets the time of the alert ',
    },

  ];

  const columns = [
    {
      title: 'command',
      dataIndex: 'command',
      key: 'name',
    }, {
      title: 'topic',
      dataIndex: 'topic',
      key: 'topic',
    }, {
      title: 'example',
      dataIndex: 'example',
      key: 'example',
    },
    {
      title: 'description',
      dataIndex: 'description',
      key: 'description',
    },

  ];

  return (
    <Layout>
      <Header >Header</Header>
      <Layout>
        {showSider()}
        <Content className='content'>
          <Title id="Introduction">Introduction</Title>
          <Paragraph>
            This project is a demo to play with various technologie, such as µC Programming, MQTT, Node-Red. Therefore I created a light that is based on an ESP32, programmed with Arduino/PlatformIO. This lamp has three "panels" with 24 LED's, totaling 72 LEDs. All LED's are WS2812 and are therefore individually adressable. It keeps track of the time, using NTP. The device can be controlled via custom MQTT commands. These command can be triggered using for example a simple Node-Red Dashboard, which can be accessed with any browser.
          </Paragraph>
          < Title level={2}>Folder Structure</Title>
          <Paragraph>
            All files (are supposed to be) / are included in this repository, including the source file to this documentation. The folders are structured into.
          </Paragraph>
          <ul>
            <li>docs</li>
            <li>docs_src</li>
            <li>electronics</li>
            <li>firmware</li>
            <li>flutter_app</li>
            <li>housing</li>
          </ul>
          <Title id="Hardware"> Hardware</Title>
          <Title id="Electronics" level={2}> Electronics</Title>
          <Paragraph>
            The PCB has been manufactured by jlcpcb and was designed in EasyEDA. I am planning to move the schematics and the layout to KiCad in the future.
          </Paragraph>
          <Carousel style={{ width: '600px', margin: '0 auto' }} autoplay>
            <div className='center' >
              <img style={contentStyle} alt="The Circuit" src={process.env.PUBLIC_URL + "/img/circuit.png"}></img>
            </div>
            <div>
              <img style={contentStyle} alt="The Layout" src={process.env.PUBLIC_URL + "/img/Layout.png"}></img>
            </div>
            <div>
              <img style={contentStyle} alt="The PCB" src={process.env.PUBLIC_URL + "/img/pcb.jpg"}></img>
            </div>
            <div>
              <img style={contentStyle} alt="The PCB" src={process.env.PUBLIC_URL + "/img/PCB's.jpg"}></img>
            </div>

          </Carousel>
          <Title level={2} id="Housing"> Housing</Title>

          <STL position={[0, 0, 0]} />

          <Title id="Firmware"> Firmware</Title>
          <Paragraph>
            Programming the device requires an FT232, since I saved the space on the pcb for it. The device must be put into programming mode, therefore GPIO0 has to be LOW, see docs.espressif.com/ You can find the most relevant parts of the code below (a description will follow).
          </Paragraph>
          <Tabs defaultActiveKey="1" >
            <TabPane tab="main.cpp" key="1">

              <Highlight {...defaultProps} code={main} language="cpp">
                {({ className, style, tokens, getLineProps, getTokenProps }) => (
                  <pre className={className} style={style}>
                    {tokens.map((line, i) => (
                      <div {...getLineProps({ line, key: i })}>
                        {line.map((token, key) => (
                          <span {...getTokenProps({ token, key })} />
                        ))}
                      </div>
                    ))}
                  </pre>
                )}
              </Highlight>

            </TabPane>
            <TabPane tab="helper.hpp" key="2">
              <Highlight {...defaultProps} code={helper} language="cpp">
                {({ className, style, tokens, getLineProps, getTokenProps }) => (
                  <pre className={className} style={style}>
                    {tokens.map((line, i) => (
                      <div {...getLineProps({ line, key: i })}>
                        {line.map((token, key) => (
                          <span {...getTokenProps({ token, key })} />
                        ))}
                      </div>
                    ))}
                  </pre>
                )}
              </Highlight>

            </TabPane>
            <TabPane tab="rgb_lighthelper.hpp" key="3">
              <Highlight {...defaultProps} code={rgb_lighthelper} language="cpp">
                {({ className, style, tokens, getLineProps, getTokenProps }) => (
                  <pre className={className} style={style}>
                    {tokens.map((line, i) => (
                      <div {...getLineProps({ line, key: i })}>
                        {line.map((token, key) => (
                          <span {...getTokenProps({ token, key })} />
                        ))}
                      </div>
                    ))}
                  </pre>
                )}
              </Highlight>

            </TabPane>colormatrix_helper
            <TabPane tab="colormatrix_helper.hpp" key="4">
              <Highlight {...defaultProps} code={colormatrix_helper} language="cpp">
                {({ className, style, tokens, getLineProps, getTokenProps }) => (
                  <pre className={className} style={style}>
                    {tokens.map((line, i) => (
                      <div {...getLineProps({ line, key: i })}>
                        {line.map((token, key) => (
                          <span {...getTokenProps({ token, key })} />
                        ))}
                      </div>
                    ))}
                  </pre>
                )}
              </Highlight>
            </TabPane>
          </Tabs>
          <Title level={2}>RGB Control</Title>
          <Title level={2}>Sleep Timer</Title>
          <Title level={2}>Alert</Title>
          <Title level={2}>Flicker</Title>
          <Title id="Software">Software</Title>

          <Title id="MQTT Commands" level={2}>MQTT Commands</Title>
          The Lamp can be controlled via different MQTT commands, which are described in the table below.
          <Collapse  >
            <Panel header="MQTT Commands" key="1">
              <p>
                <Table dataSource={dataSource} columns={columns} />
              </p>
            </Panel>

          </Collapse>


          <Title id="Node-Red Dashboard" level={2}>Node-Red Dashboard</Title>
          To control the lamp a simple Node Red Dashboard can be used, see <a href="https://flows.nodered.org/node/node-red-dashboard">node-red-dashboard</a>.
          <Title id="Flutter App">Flutter App </Title>
          The app can also be controlled by the Flutter App which is shown below.


          <Carousel style={{ width: '600px', margin: '0 auto' }} autoplay>
            <div className='center' >
              <img style={contentStylePortait} alt="Empty Dashboard" src={process.env.PUBLIC_URL + "/img/App/empty.png"}></img>
            </div>
            <div className='center' >
              <img style={contentStylePortait} alt="Edit Connection" src={process.env.PUBLIC_URL + "/img/App/edit_connection.png"}></img>
            </div>
            <div className='center' >
              <img style={contentStylePortait} alt="Add Toggle Button" src={process.env.PUBLIC_URL + "/img/App/add_toggle.png"}></img>
            </div>
            <div className='center' >
              <img style={contentStylePortait} alt="Add RGB Button" src={process.env.PUBLIC_URL + "/img/App/add_rgb.png"}></img>
            </div>
            <div className='center' >
              <img style={contentStylePortait} alt="Full Dashboard" src={process.env.PUBLIC_URL + "/img/App/full_dashboard.png"}></img>
            </div>


          </Carousel>
        </Content></Layout>
      <Footer ></Footer>
    </Layout >
  );
}

export default App;
